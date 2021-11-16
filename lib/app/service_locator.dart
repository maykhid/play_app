import 'package:get_it/get_it.dart';
import 'package:play_app/data/local_storage/database/shared.dart';
import 'package:play_app/data/local_storage/moor_db/tables.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  // getDbConstructor() {
  //   if (kIsWeb) {
  //     return web.constructDb();
  //   }
  //   return mobile.constructDb();
  // }
  locator.registerSingleton<PlayerDatabase>(constructDb(),
      dispose: (db) => db.close());
}
