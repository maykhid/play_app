import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart' as paths;
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:play_app/data/local_storage/moor_db/tables.dart';
export 'package:play_app/data/local_storage/database/shared.dart';

// PlayerDatabase constructDb({bool logStatements = false}) {
//   if (Platform.isIOS || Platform.isAndroid) {
//     final executor = LazyDatabase(() async {
//       final dataDir = await paths.getApplicationDocumentsDirectory();
//       final dbFile = File(p.join(dataDir.path, 'db.sqlite'));
//       return NativeDatabase(dbFile, logStatements: logStatements);
//     });
//     return PlayerDatabase(executor);
//   }
//   if (Platform.isMacOS || Platform.isLinux) {
//     final file = File('db.sqlite');
//     return PlayerDatabase(NativeDatabase(file, logStatements: logStatements));
//   }
//   return PlayerDatabase(NativeDatabase.memory(logStatements: logStatements));
// }

PlayerDatabase constructDb({bool logStatements = false}) {
  final db = LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
  return PlayerDatabase(db);
}
