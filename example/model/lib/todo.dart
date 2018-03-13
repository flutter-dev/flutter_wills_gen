library todo;

import 'package:flutter_wills/flutter_wills.dart';
import 'package:flutter_wills_gen/wills.dart';

part 'todo.g.dart';

@wills
abstract class Todo extends Object with Reactive {

  List<String> list;

  Map<String, int> map;

  Todo.$();

  factory Todo() = _$Todo;

}