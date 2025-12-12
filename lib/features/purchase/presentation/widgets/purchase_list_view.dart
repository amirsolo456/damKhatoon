import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatoon_container/features/purchase/presentation/bloc/purchase_bloc.dart';
import 'package:khatoon_container/features/purchase/presentation/bloc/purchase_event.dart';
import 'package:khatoon_container/features/purchase/presentation/bloc/purchase_state.dart';



class PurchaseListView extends StatelessWidget {
  const PurchaseListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseBloc, PurchaseState>(
      builder: (context, state) {
        if (state is PurchaseLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is PurchaseErrorState) {
          return Center(
            child: Text(state.message),
          );
        }

        if (state is PurchasesLoadedState) {
          final invoices = state.invoices;

          if (invoices.isEmpty) {
            return const Center(
              child: Text('هیچ فاکتور خریدی ثبت نشده است'),
            );
          }

          return ListView.builder(
            itemCount: invoices.length,
            itemBuilder: (context, index) {
              final invoice = invoices[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('فاکتور ${invoice.id}'),
                  subtitle: Text(
                    'فروشنده: ${invoice.sellerId} - مبلغ: ${invoice.totalAmount}',
                  ),
                  trailing: Chip(
                    label: Text(
                      invoice.isSettled ? 'تسویه شده' : 'در انتظار',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor:
                    invoice.isSettled ? Colors.green : Colors.orange,
                  ),
                  onTap: () {
                    // رفتن به صفحه جزئیات فاکتور
                  },
                ),
              );
            },
          );
        }

        return Container();
      },
    );
  }
}