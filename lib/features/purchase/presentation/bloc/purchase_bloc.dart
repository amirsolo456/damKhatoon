import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:khatoon_container/features/purchase/domain/entities/delivery.dart';
import 'package:khatoon_container/features/purchase/domain/entities/payment.dart';
import 'package:khatoon_container/features/purchase/domain/entities/purchase_invoice.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/get_purchase_usecase.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/update_purchase_usecase.dart';

import '../../domain/usecases/create_purchase_usecase.dart';

part 'purchase_event.dart';
part 'purchase_state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  final GetAllPurchasesUseCase getPurchasesUseCase;
  final CreatePurchaseUseCase createPurchaseUseCase;
  final UpdatePurchaseUseCase updatePurchase;

  PurchaseBloc({
    required this.getPurchasesUseCase,
    required this.createPurchaseUseCase,
    required this.updatePurchase,
  }) : super(PurchaseInitial()) {
    on<LoadPurchases>(_onLoadPurchases);
    on<CreatePurchase>(_onCreatePurchase);
  }

  Future<void> _onLoadPurchases(
      LoadPurchases event,
      Emitter<PurchaseState> emit,
      ) async {
    emit(PurchaseLoading());
    try {
      final invoices = await getPurchasesUseCase.execute();
      emit(PurchaseLoaded(invoices));
    } catch (e) {
      emit(PurchaseError('خطا در بارگذاری فاکتورها: ${e.toString()}'));
    }
  }

  Future<void> _onCreatePurchase(
      CreatePurchase event,
      Emitter<PurchaseState> emit,
      ) async {
    try {
      await createPurchaseUseCase.execute(event.invoice);
      // پس از ایجاد، دوباره بارگذاری کن
      add(LoadPurchases());
    } catch (e) {
      emit(PurchaseError('خطا در ایجاد فاکتور: ${e.toString()}'));
    }
  }
}