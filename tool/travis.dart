import 'dart:async';
import 'package:tekartik_build_utils/cmd_run.dart';

Future test(String git,
    {List<String> platforms,
    String name,
    List<String> pubTestPackageArgs}) async {
  var args = ['run', 'pubtest:pubtestpackage', '-sgit', git, '-r', 'expanded'];
  if (platforms != null) {
    args.addAll(['-p', platforms.join(',')]);
  }
  if (name != null) {
    args.addAll(['--name', 'index_cursor']);
  }
  if (pubTestPackageArgs != null) {
    args.addAll(pubTestPackageArgs);
  }
  // verbose
  args.add('-v');
  var cmd = pubCmd(args);
  await runCmd(cmd);
}

Future main() async {
  //  pub run pubtest:pubtestpackage -sgit git://github.com/tekartik/tekartik_io_utils.dart -v
  await test('git://github.com/tekartik/tekartik_io_utils.dart');
  // pkgtest git://github.com/tekartik/idb_shim.dart -p chrome test/idb_browser_test.dart --name index_cursor
  // await test('git://github.com/tekartik/idb_shim.dart', platforms: ['chrome'], pubTestPackageArgs: ['test/idb_browser_test.dart'], /*name: 'index_cursor'*/);
}
