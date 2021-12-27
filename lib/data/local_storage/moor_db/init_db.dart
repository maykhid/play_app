import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift/web.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

WebDatabase openConnection() {
  // return LazyDatabase(() async {

  //   final dbFolder = await getApplicationDocumentsDirectory();
  //   final file = File(p.join(dbFolder.path, 'db.sqlite'));
  //   return NativeDatabase(file);
  // });
  return WebDatabase('db', logStatements: false);
}
