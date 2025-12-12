import 'package:bloc/bloc.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/delivery_usecase.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/order_usecase.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/payment_usecase.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/purchase_item_usecase.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/purchase_usecase.dart';
import 'package:khatoon_container/features/purchase/presentation/bloc/purchase_bloc.dart';
import 'package:khatoon_container/features/purchase/presentation/bloc/purchase_state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  // Purchase Invoice UseCases
  final GetPurchasesUseCase getPurchasesUseCase;
  final GetPurchasesByIdUseCase getPurchasesByIdUseCase;
  final CreatePurchaseUseCase createPurchaseUseCase;
  final UpdatePurchaseUseCase updatePurchaseUseCase;
  final DeletePurchaseUseCase deletePurchaseUseCase;

  // Purchase Item UseCases
  final GetPurchasesItemsByPurchaseIdUseCase getPurchasesItemsUseCase;
  final CreatePurchaseItemUseCase createPurchaseItemUseCase;
  final UpdatePurchaseItemUseCase updatePurchaseItemUseCase;
  final DeletePurchaseItemByIdUseCase deletePurchaseItemUseCase;

  // Payment UseCases
  final GetPaymentsByInvoiceIdUseCase getPaymentsUseCase;
  final CreatePaymentUseCase createPaymentUseCase;
  final CreatePaymentsUseCase createPaymentsUseCase;
  final UpdatePaymentUseCase updatePaymentUseCase;
  final DeletePaymentUseCase deletePaymentUseCase;
  final DeletePaymentsByIdUseCase deletePaymentByIdUseCase;

  // Order UseCases
  final GetOrdersByPurchaseIdUseCase getOrdersUseCase;
  final CreateOrderUseCase createOrderUseCase;
  final UpdateOrderUseCase updateOrderUseCase;
  final DeleteOrderUseCase deleteOrderUseCase;
  final DeleteOrdersByIdUseCase deleteOrderByIdUseCase;

  // Delivery UseCases
  final GetDeliveryByPurchaseIdUseCase getDeliveriesUseCase;
  final CreateDeliveryUseCase createDeliveryUseCase;
  final UpdateDeliveryUseCase updateDeliveryUseCase;
  final DeleteDeliveryUseCase deleteDeliveryUseCase;
  final DeleteDeliveriesByIdUseCase deleteDeliveryByIdUseCase;

  PurchaseBloc({
    // Purchase Invoice
    required this.getPurchasesUseCase,
    required this.getPurchasesByIdUseCase,
    required this.createPurchaseUseCase,
    required this.updatePurchaseUseCase,
    required this.deletePurchaseUseCase,
    // Purchase Item
    required this.getPurchasesItemsUseCase,
    required this.createPurchaseItemUseCase,
    required this.updatePurchaseItemUseCase,
    required this.deletePurchaseItemUseCase,
    // Payment
    required this.getPaymentsUseCase,
    required this.createPaymentUseCase,
    required this.createPaymentsUseCase,
    required this.updatePaymentUseCase,
    required this.deletePaymentUseCase,
    required this.deletePaymentByIdUseCase,
    // Order
    required this.getOrdersUseCase,
    required this.createOrderUseCase,
    required this.updateOrderUseCase,
    required this.deleteOrderUseCase,
    required this.deleteOrderByIdUseCase,
    // Delivery
    required this.getDeliveriesUseCase,
    required this.createDeliveryUseCase,
    required this.updateDeliveryUseCase,
    required this.deleteDeliveryUseCase,
    required this.deleteDeliveryByIdUseCase,
  }) : super(PurchaseInitial()) {
    // Purchase Invoice Events
    on<LoadPurchasesEvent>(_onLoadPurchases);
    on<GetPurchaseByIdEvent>(_onGetPurchaseById);
    on<CreatePurchaseEvent>(_onCreatePurchase);
    on<UpdatePurchaseEvent>(_onUpdatePurchase);
    on<DeletePurchaseEvent>(_onDeletePurchase);

    // Purchase Item Events
    on<GetPurchaseItemsEvent>(_onGetPurchaseItems);
    on<CreatePurchaseItemEvent>(_onCreatePurchaseItem);
    on<UpdatePurchaseItemEvent>(_onUpdatePurchaseItem);
    on<DeletePurchaseItemEvent>(_onDeletePurchaseItem);

    // Payment Events
    on<GetPaymentsEvent>(_onGetPayments);
    on<CreatePaymentEvent>(_onCreatePayment);
    on<UpdatePaymentEvent>(_onUpdatePayment);
    on<DeletePaymentEvent>(_onDeletePayment);

    // Order Events
    on<GetOrdersEvent>(_onGetOrders);
    on<CreateOrderEvent>(_onCreateOrder);
    on<UpdateOrderEvent>(_onUpdateOrder);
    on<DeleteOrderEvent>(_onDeleteOrder);

    // Delivery Events
    on<GetDeliveriesEvent>(_onGetDeliveries);
    on<CreateDeliveryEvent>(_onCreateDelivery);
    on<UpdateDeliveryEvent>(_onUpdateDelivery);
    on<DeleteDeliveryEvent>(_onDeleteDelivery);
  }

  // ============ Purchase Invoice Handlers ============
  Future<void> _onLoadPurchases(
    LoadPurchasesEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    emit(PurchaseLoading());
    try {
      final invoices = await getPurchasesUseCase.execute();
      emit(PurchasesLoadedState(invoices));
    } catch (e) {
      emit(PurchaseErrorState('خطا در بارگذاری فاکتورها: ${e.toString()}'));
    }
  }

  Future<void> _onGetPurchaseById(
    GetPurchaseByIdEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    emit(PurchaseLoading());
    try {
      final invoice = await getPurchasesByIdUseCase.execute(event.id);
      emit(PurchaseByIdLoaded(invoice));
    } catch (e) {
      emit(PurchaseErrorState('خطا در دریافت فاکتور: ${e.toString()}'));
    }
  }

  Future<void> _onCreatePurchase(
    CreatePurchaseEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    emit(PurchaseLoading());
    try {
      await createPurchaseUseCase.execute(event.invoice);
      emit(PurchaseCreatedState(event.invoice));
      // بعد از ایجاد، لیست را رفرش کن
      add(LoadPurchasesEvent());
    } catch (e) {
      emit(PurchaseErrorState('خطا در ایجاد فاکتور: ${e.toString()}'));
    }
  }

  Future<void> _onUpdatePurchase(
    UpdatePurchaseEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    emit(PurchaseLoading());
    try {
      await updatePurchaseUseCase.execute(event.invoice);
      emit(PurchaseUpdatedState(event.invoice));
    } catch (e) {
      emit(PurchaseErrorState('خطا در بروزرسانی فاکتور: ${e.toString()}'));
    }
  }

  Future<void> _onDeletePurchase(
    DeletePurchaseEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    emit(PurchaseLoading());
    try {
      await deletePurchaseUseCase.execute(event.purchase);
      emit(PurchaseDeletedState(event.purchase));
      // بعد از حذف، لیست را رفرش کن
      add(LoadPurchasesEvent());
    } catch (e) {
      emit(PurchaseErrorState('خطا در حذف فاکتور: ${e.toString()}'));
    }
  }

  // ============ Purchase Item Handlers ============
  Future<void> _onGetPurchaseItems(
    GetPurchaseItemsEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    emit(PurchaseItemsLoading());
    try {
      final items = await getPurchasesItemsUseCase.execute(event.purchase);
      emit(PurchaseItemsLoadedState(items));
    } catch (e) {
      emit(PurchaseErrorState('خطا در دریافت آیتم‌های خرید: ${e.toString()}'));
    }
  }

  Future<void> _onCreatePurchaseItem(
    CreatePurchaseItemEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      final createdItem = await createPurchaseItemUseCase.execute(
        event.purchase,
        event.item,
      );
      emit(PurchaseItemCreatedState(event.item));
    } catch (e) {
      emit(PurchaseErrorState('خطا در ایجاد آیتم خرید: ${e.toString()}'));
    }
  }

  Future<void> _onUpdatePurchaseItem(
    UpdatePurchaseItemEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      await updatePurchaseItemUseCase.execute(event.item);
      emit(PurchaseItemUpdatedState(event.item));
    } catch (e) {
      emit(PurchaseErrorState('خطا در بروزرسانی آیتم خرید: ${e.toString()}'));
    }
  }

  Future<void> _onDeletePurchaseItem(
    DeletePurchaseItemEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      await deletePurchaseItemUseCase.execute(event.item);
      emit(PurchaseItemDeletedState(event.item));
    } catch (e) {
      emit(PurchaseErrorState('خطا در حذف آیتم خرید: ${e.toString()}'));
    }
  }

  // ============ Payment Handlers ============
  Future<void> _onGetPayments(
    GetPaymentsEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    emit(PaymentsLoading());
    try {
      final payments = await getPaymentsUseCase.execute(event.invoice);
      emit(PaymentsLoadedState(payments));
    } catch (e) {
      emit(PurchaseErrorState('خطا در دریافت پرداخت‌ها: ${e.toString()}'));
    }
  }

  Future<void> _onCreatePayment(
    CreatePaymentEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      final createdPayment = await createPaymentUseCase.execute(
        event.invoice,
        event.payment,
      );
      emit(PaymentCreatedState(event.payment));
    } catch (e) {
      emit(PurchaseErrorState('خطا در ایجاد پرداخت: ${e.toString()}'));
    }
  }

  Future<void> _onUpdatePayment(
    UpdatePaymentEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      await updatePaymentUseCase.execute(event.payment);
      emit(PaymentUpdatedState(event.payment));
    } catch (e) {
      emit(PurchaseErrorState('خطا در بروزرسانی پرداخت: ${e.toString()}'));
    }
  }

  Future<void> _onDeletePayment(
    DeletePaymentEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      await deletePaymentUseCase.execute(event.payment);
      emit(PaymentDeletedState(event.payment));
    } catch (e) {
      emit(PurchaseErrorState('خطا در حذف پرداخت: ${e.toString()}'));
    }
  }

  // ============ Order Handlers ============
  Future<void> _onGetOrders(
    GetOrdersEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    emit(OrdersLoading());
    try {
      final orders = await getOrdersUseCase.execute(event.purchase);
      emit(OrdersLoadedState(orders));
    } catch (e) {
      emit(PurchaseErrorState('خطا در دریافت سفارش‌ها: ${e.toString()}'));
    }
  }

  Future<void> _onCreateOrder(
    CreateOrderEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      final createdOrder = await createOrderUseCase.execute(
        event.purchase,
        event.order,
      );
      emit(OrderCreatedState(event.order));
    } catch (e) {
      emit(PurchaseErrorState('خطا در ایجاد سفارش: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateOrder(
    UpdateOrderEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      await updateOrderUseCase.execute(event.order);
      emit(OrderUpdatedState(event.order));
    } catch (e) {
      emit(PurchaseErrorState('خطا در بروزرسانی سفارش: ${e.toString()}'));
    }
  }

  Future<void> _onDeleteOrder(
    DeleteOrderEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      await deleteOrderUseCase.execute(event.order);
      emit(OrderDeletedState(event.order));
    } catch (e) {
      emit(PurchaseErrorState('خطا در حذف سفارش: ${e.toString()}'));
    }
  }

  // ============ Delivery Handlers ============
  Future<void> _onGetDeliveries(
    GetDeliveriesEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    emit(DeliveriesLoading());
    try {
      final deliveries = await getDeliveriesUseCase.execute(event.purchase);
      emit(DeliveriesLoadedState(deliveries));
    } catch (e) {
      emit(PurchaseErrorState('خطا در دریافت تحویل‌ها: ${e.toString()}'));
    }
  }

  Future<void> _onCreateDelivery(
    CreateDeliveryEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      final createdDelivery = await createDeliveryUseCase.execute(
        event.purchase,
        event.delivery,
      );
      emit(DeliveryCreatedState(event.delivery));
    } catch (e) {
      emit(PurchaseErrorState('خطا در ایجاد تحویل: ${e.toString()}'));
    }
  }

  Future<void> _onUpdateDelivery(
    UpdateDeliveryEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      await updateDeliveryUseCase.execute(event.delivery);
      emit(DeliveryUpdatedState(event.delivery));
    } catch (e) {
      emit(PurchaseErrorState('خطا در بروزرسانی تحویل: ${e.toString()}'));
    }
  }

  Future<void> _onDeleteDelivery(
    DeleteDeliveryEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    try {
      await deleteDeliveryUseCase.execute(event.delivery);
      emit(DeliveryDeletedState(event.delivery.id));
    } catch (e) {
      emit(PurchaseErrorState('خطا در حذف تحویل: ${e.toString()}'));
    }
  }
}
