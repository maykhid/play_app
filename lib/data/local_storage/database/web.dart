import 'package:drift/web.dart';
import 'package:play_app/data/local_storage/moor_db/tables.dart';
export 'package:play_app/data/local_storage/database/shared.dart';

PlayerDatabase constructDb({bool logStatements = false}) {
  return PlayerDatabase(WebDatabase('db', logStatements: logStatements));
}
