import 'dart:async';

import 'package:build_runner/build_runner.dart';
import 'package:flutter_wills_gen/flutter_wills_gen.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build_runner/src/generate/build_impl.dart' as build_impl;

Future main(List<String> args) async {
  await build_impl.build([
    new BuildAction(
        new PartBuilder([
          new WillsGenerator(),
        ]),
        'model',
        inputs: const ['lib/*.dart'])
  ], deleteFilesByDefault: true, skipBuildScriptCheck: true);
}