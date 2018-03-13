import 'dart:async';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:source_gen/src/utils.dart';
import 'package:build/build.dart';
import 'package:flutter_wills_gen/wills.dart';

class WillsGenerator extends GeneratorForAnnotation<Wills> {

  Future<String> generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) async {
    if(element is! ClassElement) {
      var friendlyName = friendlyNameForElement(element);
      throw new InvalidGenerationSourceError(
          'Generator cannot target `$friendlyName`.',
          todo: 'Remove the @wills annotation from `$friendlyName`.');
    }
    return _implClass(element);
  }

  String _implClass(ClassElement el) {
    var name = el.name;
    var body = new StringBuffer();
    var constructorParams = new StringBuffer();
    var assignParams = new StringBuffer();

    String fieldType, fieldName, fieldVal;

    for (var field in el.fields) {
      if (field.isStatic || field.isPrivate)
        continue;

      fieldType = field.type.toString();
      fieldName = field.name;
      fieldVal = _defaultValue(fieldType);

      if(constructorParams.length == 0) {
        constructorParams.writeln('{');
      }

      constructorParams.writeln(fieldVal != null ? '${fieldType} ${fieldName} : $fieldVal,' : '${fieldType} ${fieldName},');
      assignParams.writeln('.._${fieldName} = ${fieldName}');
      body.writeln('${fieldType} _${fieldName};');
      body.writeln(_implMethod(fieldType, fieldName, fieldVal));
    }

    var supertype = el.supertype;
    while(supertype != null && supertype.element.type.name != 'Object') {
      for(var field in supertype.element.fields) {
        if(field.isPrivate || field.isStatic) continue;
        fieldType = field.type.toString();
        fieldName = field.name;
        fieldVal = _defaultValue(fieldType);
        constructorParams.writeln(fieldVal != null ? '${fieldType} ${fieldName} : $fieldVal,' : '${fieldType} ${fieldName},');
        assignParams.writeln('..${fieldName} = ${fieldName}');
      }
      supertype = supertype.element.supertype;
    }

    if(constructorParams.length > 0) {
      constructorParams.write('}');
    }

    return '''
      class _\$$name extends $name {
        $body
        _\$$name.\$(): super.\$();
        factory _\$$name($constructorParams) {
          return new _\$$name.\$()
            $assignParams;
        }
      }
      ''';
  }

  String _implMethod(String type, String name, String val) {
    return '''
    $type get $name { 
      \$observe('$name'); 
      ${val != null ? '_$name =  _$name ?? $val;' : ''}
      \$checkType(_$name);
      return _$name; 
    }
    set $name($type $name) {
      if ($name != null && $name == _$name) return;
      _$name = $name;
      \$notify('$name');
    }
    ''';
  }

  String _defaultValue(String type) {
    switch (type) {
      case 'String': return "''";
      case 'bool': return 'false';
      case 'double': return '0.0';
      case 'num': return '0';
      case 'int': return '0';
      default: return null;
    }
  }
  
}