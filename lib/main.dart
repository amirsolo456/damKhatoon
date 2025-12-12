import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import 'package:khatoon_container/features/purchase/presentation/pages/purchase_list_page.dart';
import 'package:khatoon_container/features/user/data/data_sources/user_local_data_source.dart';
import 'package:khatoon_container/features/user/data/models/user_model/user_model.dart';
import 'package:khatoon_container/features/user/domain/entities/user_dto/user.dart';
import 'package:khatoon_container/injection_container.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مدیریت دامداری',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PurchaseListPage(),
    );
  }
}
