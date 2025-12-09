import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/create_purchase_usecase.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/get_purchase_usecase.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/update_purchase_usecase.dart';
import 'package:khatoon_container/features/purchase/presentation/bloc/purchase_bloc.dart';
import 'package:khatoon_container/features/purchase/presentation/widgets/purchase_list_view.dart';

class PurchaseListPage extends StatelessWidget {
  const PurchaseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // استفاده از BlocProvider برای ارائه BLoC به زیردرخت
    return BlocProvider(
      create: (context) {
        // اینجا باید use caseها را از DI container بگیرید
        // فعلاً با ساختار قبلی می‌توانید از context.read برای سرویس‌ها استفاده کنید
        return PurchaseBloc(
          updatePurchase: UpdatePurchaseUseCase(
            repository: RepositoryProvider.of(context),
          ),
          getPurchasesUseCase: GetAllPurchasesUseCase(
            repository: RepositoryProvider.of(context), // نیاز به تنظیم دارد
          ),
          createPurchaseUseCase: CreatePurchaseUseCase(
            repository: RepositoryProvider.of(context), // نیاز به تنظیم دارد
          ),
        )..add(LoadPurchases());
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('لیست فاکتورهای خرید')),
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

// صفحه ایجاد فاکتور (یک نمونه ساده)
class CreatePurchasePage extends StatelessWidget {
  const CreatePurchasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ثبت فاکتور خرید جدید')),
      body: const Center(child: Text('فرم ثبت فاکتور خرید اینجا قرار می‌گیرد')),
    );
  }
}
