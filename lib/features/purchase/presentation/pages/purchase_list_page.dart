// purchase_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:khatoon_container/features/purchase/presentation/bloc/purchase_bloc.dart';
import 'package:khatoon_container/features/purchase/presentation/bloc/purchase_event.dart';
import 'package:khatoon_container/features/purchase/presentation/widgets/purchase_list_view.dart';

class PurchaseListPage extends StatelessWidget {
  const PurchaseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ابتدا مطمئن شویم GetIt initialize شده است
    return BlocProvider(
      create: (context) {
        // دریافت بلوک از GetIt
        final bloc = GetIt.instance<PurchaseBloc>();
        // اضافه کردن event اولیه
        bloc.add(LoadPurchasesEvent());
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('لیست فاکتورهای خرید'),
        ),
        body: const PurchaseListView(),
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

class CreatePurchasePage extends StatelessWidget {
  const CreatePurchasePage({super.key});

  @override
  Widget build(BuildContext context) {
    // استفاده از همان بلوک صفحه لیست
    final purchaseBloc = context.read<PurchaseBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ثبت فاکتور خرید جدید'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // فرم ایجاد فاکتور اینجا قرار می‌گیرد
            // ...
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ایجاد فاکتور جدید
                // final invoice = PurchaseInvoiceModel(...);
                // purchaseBloc.add(CreatePurchaseEvent(invoice));

                // بعد از ایجاد، بازگشت به صفحه لیست
                Navigator.pop(context);
              },
              child: const Text('ثبت فاکتور'),
            ),
          ],
        ),
      ),
    );
  }
}