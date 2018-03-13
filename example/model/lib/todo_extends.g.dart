// GENERATED CODE - DO NOT MODIFY BY HAND

part of todo_extends;

// **************************************************************************
// Generator: WillsGenerator
// **************************************************************************

class _$TodoExtends extends TodoExtends {
  int _newProp;
  int get newProp {
    $observe('newProp');
    _newProp = _newProp ?? 0;
    $checkType(_newProp);
    return _newProp;
  }

  set newProp(int newProp) {
    if (newProp != null && newProp == _newProp) return;
    _newProp = newProp;
    $notify('newProp');
  }

  _$TodoExtends.$() : super.$();
  factory _$TodoExtends({
    int newProp: 0,
    List<String> list,
    Map<String, int> map,
  }) {
    return new _$TodoExtends.$()
      .._newProp = newProp
      ..list = list
      ..map = map;
  }
}
