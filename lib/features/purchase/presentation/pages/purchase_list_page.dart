// purchase_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
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
    final notifier = Provider.of<AppNotifier>(context);
    return BlocProvider(
       create: (context) => sl<PurchaseBloc>()..add(LoadPurchasesEvent()),

      // create: (context) {
      //   final bloc = sl<PurchaseBloc>();
      //   bloc.add(LoadPurchasesEvent());
      //   return bloc;
      // },
      child: Scaffold(
        appBar: AppBar(title: const Text('لیست فاکتورهای خرید')),
        body:const PurchaseListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
               MaterialPageRoute(
                builder: (context) => const CreatePurchasePage(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}


