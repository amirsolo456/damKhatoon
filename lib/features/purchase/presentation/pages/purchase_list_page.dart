// purchase_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatoon_container/app_notifier.dart';
import 'package:khatoon_container/features/purchase/presentation/bloc/purchase_bloc.dart';
import 'package:khatoon_container/features/purchase/presentation/bloc/purchase_event.dart';
import 'package:khatoon_container/features/purchase/presentation/pages/create_purchase_page.dart';
import 'package:khatoon_container/features/purchase/presentation/widgets/purchase_list_view.dart';
import 'package:khatoon_container/injection_container.dart';
import 'package:provider/provider.dart';

class PurchaseListPage extends StatelessWidget {
  const PurchaseListPage({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final AppNotifier notifier = Provider.of<AppNotifier>(context);
    return BlocProvider(
       create: (BuildContext context) => sl<PurchaseBloc>()..add(LoadPurchasesEvent()),
=======
    return BlocProvider(
      lazy: false,
      create: (context) => sl<PurchaseBloc>()..add(LoadPurchasesEvent()),
>>>>>>> 3c995f2a9a7bdc75699f3fac00fe4428adf8aef0

      child: Scaffold(
        appBar: AppBar(title: const Text('لیست فاکتورهای خرید')),
        body: const PurchaseListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
<<<<<<< HEAD
               MaterialPageRoute(
                builder: (BuildContext context) => const CreatePurchasePage(),
=======
              MaterialPageRoute(
                builder: (context) => const CreatePurchasePage(),
>>>>>>> 3c995f2a9a7bdc75699f3fac00fe4428adf8aef0
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
