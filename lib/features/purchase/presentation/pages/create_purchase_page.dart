import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatoon_container/features/purchase/presentation/bloc/purchase_bloc.dart';

class CreatePurchasePage extends StatelessWidget {
  const CreatePurchasePage({super.key});

  @override
  Widget build(BuildContext context) {
    // استفاده از همان بلوک صفحه لیست
    final PurchaseBloc purchaseBloc = context.read<PurchaseBloc>();

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
          children: <Widget>[
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