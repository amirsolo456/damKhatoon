import 'package:flutter/material.dart';
import 'package:khatoon_container/features/purchase/presentation/pages/purchase_list_page.dart';
import 'package:khatoon_container/injection_container.dart';

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
