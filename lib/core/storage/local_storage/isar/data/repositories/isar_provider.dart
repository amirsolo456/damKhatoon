/*
import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:khatoon_container/injection_container.dart';
import 'package:path_provider/path_provider.dart';
import 'package:khatoon_container/features/user/data/models/user_model/user_model.dart';

class IsarProvider {
  Future<Isar> getIsarProvider() async{

    final dir = await getApplicationDocumentsDirectory();



    return await Isar.open(
      [UserModelSchema],
      name: 'khatoon_db',
      directory: dir.path, // مسیر پوشه رو میدیم
    );
  }

  Future<void> setupDependencies() async {
    WidgetsFlutterBinding.ensureInitialized();

    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [UserModelSchema],
      name: 'khatoon_db',
      directory: dir.path,
    );

    sl.registerSingleton<Isar>(isar);

  }
}

// در main.dart
// void main() {
//   runApp(
//     const ProviderScope(
//       child: MyApp(),
//     ),
//   );
// }*/
