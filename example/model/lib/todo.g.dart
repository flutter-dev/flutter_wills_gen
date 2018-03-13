// GENERATED CODE - DO NOT MODIFY BY HAND

part of todo;

// **************************************************************************
// Generator: WillsGenerator
// **************************************************************************

class _$Todo extends Todo {
  List<String> _list;
  List<String> get list {
    $observe('list');

    $checkType(_list);
    return _list;
  }

  set list(List<String> list) {
    if (list != null && list == _list) return;
    _list = list;
    $notify('list');
  }

  Map<String, int> _map;
  Map<String, int> get map {
    $observe('map');

    $checkType(_map);
    return _map;
  }

  set map(Map<String, int> map) {
    if (map != null && map == _map) return;
    _map = map;
    $notify('map');
  }

  _$Todo.$() : super.$();
  factory _$Todo({
    List<String> list,
    Map<String, int> map,
  }) {
    return new _$Todo.$()
      .._list = list
      .._map = map;
  }
}
