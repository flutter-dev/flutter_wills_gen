library todo_extends;

import 'package:flutter_wills_gen/wills.dart';
import 'package:model/todo.dart';

part 'todo_extends.g.dart';

@wills
abstract class TodoExtends extends Todo {

  int newProp;

  TodoExtends.$(): super.$();

  factory TodoExtends() = _$TodoExtends;

}