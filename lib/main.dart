import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_invoice_model.dart';
import 'package:khatoon_container/features/purchase/presentation/pages/purchase_list_page.dart';
import 'package:khatoon_container/injection_container.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InjectionContainer.init();// راه‌اندازی dependency injection
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register adapters
  Hive.registerAdapter(PurchaseInvoiceModelAdapter());

  // Open boxes
  await Hive.openBox<PurchaseInvoiceModel>('purchases');

  // Setup DI
  await setup();

  runApp(MyApp());
  runApp(MyApp());
}

extension on HiveInterface {
  Future<void> initFlutter() {}
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مدیریت دامداری',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PurchaseListPage(), // صفحه اول را تنظیم کنید
    );
  }
}
