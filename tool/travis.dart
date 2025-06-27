import 'dart:async';
import 'package:process_run/shell.dart';

Future test(
  String git, {
  List<String>? platforms,
  String? name,
  List<String>? pubTestPackageArgs,
}) async {
  var sb = StringBuffer(
    'dart run tekartik_pubtest:pubtestpackage -sgit ${shellArgument(git)} -r expanded -v',
  );
  if (platforms != null) {
    sb.write(' -p ${platforms.join(',')}');
  }
  if (name != null) {
    sb.write(' --name ${shellArgument(name)}');
  }
  if (pubTestPackageArgs != null) {
    sb.write(' ${shellArguments(pubTestPackageArgs)}');
  }
  await run(sb.toString());
}

Future main() async {
  //  pub run pubtest:pubtestpackage -sgit git://github.com/tekartik/tekartik_io_utils.dart -v
  await test('git://github.com/tekartik/io_utils.dart');
  // pkgtest git://github.com/tekartik/idb_shim.dart -p chrome test/idb_browser_test.dart --name index_cursor
  // await test('git://github.com/tekartik/idb_shim.dart', platforms: ['chrome'], pubTestPackageArgs: ['test/idb_browser_test.dart'], /*name: 'index_cursor'*/);
}
