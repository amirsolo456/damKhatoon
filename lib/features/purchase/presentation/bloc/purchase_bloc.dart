import 'package:bloc/bloc.dart';
import 'package:khatoon_container/features/purchase/data/models/delivery/delivery_model.dart';
import 'package:khatoon_container/features/purchase/data/models/order/order_model.dart';
import 'package:khatoon_container/features/purchase/data/models/payment/payment_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_item/purchase_item_model.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/delivery_usecase.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/order_usecase.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/payment_usecase.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/purchase_item_usecase.dart';
import 'package:khatoon_container/features/purchase/domain/usecases/purchase_usecase.dart';
import 'package:khatoon_container/features/purchase/presentation/bloc/purchase_event.dart';
import 'package:khatoon_container/features/purchase/presentation/bloc/purchase_state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
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

  // ============ Purchase Invoice Handlers ============
  Future<void> _onLoadPurchases(
    LoadPurchasesEvent event,
    Emitter<PurchaseState> emit,
  ) async {
    emit(PurchaseLoading());
    try {
      //final invoices = await getPurchasesUseCase.execute();

      final List<PurchaseInvoiceModel> invoices = fakeJsonList
          .map((Map<String, Object> j) => PurchaseInvoiceModel.fromJson(j))
          .toList();
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
      final List<PurchaseInvoiceModel> invoice = await getPurchasesByIdUseCase.execute(event.id);
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
      final List<PurchaseItemModel> items = await getPurchasesItemsUseCase.execute(event.purchase);
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
      final List<PaymentModel> payments = await getPaymentsUseCase.execute(event.invoice);
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
      final List<OrderModel> orders = await getOrdersUseCase.execute(event.purchase);
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
      final List<DeliveryModel> deliveries = await getDeliveriesUseCase.execute(event.purchase);
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

<<<<<<< HEAD
final List<Map<String, Object>> fakeJsonList =
<Map<String, Object>>[
  <String, Object>{
=======
final fakeJsonList = [
  {
>>>>>>> 3c995f2a9a7bdc75699f3fac00fe4428adf8aef0
    "id": 1,
    "sellerId": "seller_001",
    "SellerName": "شرکت تامین قطعات پلیمری",
    "notes": "صورتحساب خرید فصل اول 1403",
    "date": 1735070400000,
    "Status": 1,
    "totalAmount": 75000000.0,
    "paidAmount": 50000000.0,
    "paymentStatus": "partial",
    "deliveryStatus": "shipped",
    "isSettled": false,
<<<<<<< HEAD
    "Deliveries": <Map<String, num>>[
      <String, num>{
        "id": 101,
        "date": 1735156800000,
        "count": 1500,
        "totalWeight": 12500.5
=======
    "Deliveries": [
      {"id": 101, "date": 1735156800000, "count": 1500, "totalWeight": 12500.5},
      {"id": 102, "date": 1735243200000, "count": 800, "totalWeight": 6800.75},
    ],
    "Items": [
      {
        "id": 201,
        "name": "لوله PVC فشار قوی سایز 20",
        "quantity": 5000,
        "price": 8500.0,
      },
      {
        "id": 202,
        "name": "لوله PVC فشار قوی سایز 25",
        "quantity": 3000,
        "price": 12500.0,
      },
      {
        "id": 203,
        "name": "اتصال سه راهی 20*20*20",
        "quantity": 2000,
        "price": 3500.0,
      },
    ],
    "Payments": [
      {
        "id": 301,
        "date": 1735070400000,
        "method": "کارت به کارت",
        "sellerId": "seller_001",
        "sellerName": "شرکت تامین قطعات پلیمری",
        "status": 1,
        "totalAmount": 30000000.0,
        "paidAmount": 30000000.0,
        "paymentStatus": "paid",
        "deliveryStatus": "pending",
        "isSettled": true,
        "notes": "پیش پرداخت اولیه",
        "Deliveries": [],
        "Items": [],
        "Payments": [],
      },
      {
        "id": 302,
        "date": 1735339200000,
        "method": "چک 3 ماهه",
        "sellerId": "seller_001",
        "sellerName": "شرکت تامین قطعات پلیمری",
        "status": 0,
        "totalAmount": 45000000.0,
        "paidAmount": 20000000.0,
        "paymentStatus": "partial",
        "deliveryStatus": "pending",
        "isSettled": false,
        "notes": "چک باقیمانده",
        "Deliveries": [],
        "Items": [],
        "Payments": [],
      },
    ],
  },
  {
    "id": 2,
    "sellerId": "seller_002",
    "SellerName": "کارخانه تولید واشرهای صنعتی",
    "notes": "خرید عمده واشرهای آب بندی",
    "date": 1735425600000,
    "Status": 2,
    "totalAmount": 42000000.0,
    "paidAmount": 42000000.0,
    "paymentStatus": "paid",
    "deliveryStatus": "delivered",
    "isSettled": true,
    "Deliveries": [
      {"id": 103, "date": 1735512000000, "count": 25000, "totalWeight": 1250.0},
    ],
    "Items": [
      {
        "id": 204,
        "name": "واشر لاستیکی سایز 1/2 اینچ",
        "quantity": 10000,
        "price": 2500.0,
      },
      {
        "id": 205,
        "name": "واشر لاستیکی سایز 3/4 اینچ",
        "quantity": 8000,
        "price": 2800.0,
      },
      {
        "id": 206,
        "name": "واشر لاستیکی سایز 1 اینچ",
        "quantity": 7000,
        "price": 3200.0,
      },
    ],
    "Payments": [
      {
        "id": 303,
        "date": 1735425600000,
        "method": "نقدی",
        "sellerId": "seller_002",
        "sellerName": "کارخانه تولید واشرهای صنعتی",
        "status": 2,
        "totalAmount": 42000000.0,
        "paidAmount": 42000000.0,
        "paymentStatus": "paid",
        "deliveryStatus": "delivered",
        "isSettled": true,
        "notes": "پرداخت کامل نقدی",
        "Deliveries": [],
        "Items": [],
        "Payments": [],
>>>>>>> 3c995f2a9a7bdc75699f3fac00fe4428adf8aef0
      },
      <String, num>{
        "id": 102,
        "date": 1735243200000,
        "count": 800,
        "totalWeight": 6800.75
      }
    ],
    "Items": <Map<String, Object>>[
      <String, Object>{
        "id": 201,
        "name": "لوله PVC فشار قوی سایز 20",
        "quantity": 5000,
        "price": 8500.0
      },
      <String, Object>{
        "id": 202,
        "name": "لوله PVC فشار قوی سایز 25",
        "quantity": 3000,
        "price": 12500.0
      },
      <String, Object>{
        "id": 203,
        "name": "اتصال سه راهی 20*20*20",
        "quantity": 2000,
        "price": 3500.0
      }
    ],
    "Payments": <Map<String, Object>>[
      <String, Object>{
        "id": 301,
        "date": 1735070400000,
        "method": "کارت به کارت",
        "sellerId": "seller_001",
        "sellerName": "شرکت تامین قطعات پلیمری",
        "status": 1,
        "totalAmount": 30000000.0,
        "paidAmount": 30000000.0,
        "paymentStatus": "paid",
        "deliveryStatus": "pending",
        "isSettled": true,
        "notes": "پیش پرداخت اولیه",
        "Deliveries": <dynamic>[],
        "Items": <dynamic>[],
        "Payments": <dynamic>[]
      },
      <String, Object>{
        "id": 302,
        "date": 1735339200000,
        "method": "چک 3 ماهه",
        "sellerId": "seller_001",
        "sellerName": "شرکت تامین قطعات پلیمری",
        "status": 0,
        "totalAmount": 45000000.0,
        "paidAmount": 20000000.0,
        "paymentStatus": "partial",
        "deliveryStatus": "pending",
        "isSettled": false,
        "notes": "چک باقیمانده",
        "Deliveries": <dynamic>[],
        "Items": <dynamic>[],
        "Payments": <dynamic>[]
      }
    ]
  },
<<<<<<< HEAD
  <String, Object>{
    "id": 2,
    "sellerId": "seller_002",
    "SellerName": "کارخانه تولید واشرهای صنعتی",
    "notes": "خرید عمده واشرهای آب بندی",
    "date": 1735425600000,
    "Status": 2,
    "totalAmount": 42000000.0,
    "paidAmount": 42000000.0,
    "paymentStatus": "paid",
    "deliveryStatus": "delivered",
    "isSettled": true,
    "Deliveries": <Map<String, num>>[
      <String, num>{
        "id": 103,
        "date": 1735512000000,
        "count": 25000,
        "totalWeight": 1250.0
      }
    ],
    "Items": <Map<String, Object>>[
      <String, Object>{
        "id": 204,
        "name": "واشر لاستیکی سایز 1/2 اینچ",
        "quantity": 10000,
        "price": 2500.0
      },
      <String, Object>{
        "id": 205,
        "name": "واشر لاستیکی سایز 3/4 اینچ",
        "quantity": 8000,
        "price": 2800.0
      },
      <String, Object>{
        "id": 206,
        "name": "واشر لاستیکی سایز 1 اینچ",
        "quantity": 7000,
        "price": 3200.0
      }
    ],
    "Payments": <Map<String, Object>>[
      <String, Object>{
        "id": 303,
        "date": 1735425600000,
        "method": "نقدی",
        "sellerId": "seller_002",
        "sellerName": "کارخانه تولید واشرهای صنعتی",
        "status": 2,
        "totalAmount": 42000000.0,
        "paidAmount": 42000000.0,
        "paymentStatus": "paid",
        "deliveryStatus": "delivered",
        "isSettled": true,
        "notes": "پرداخت کامل نقدی",
        "Deliveries": <dynamic>[],
        "Items": <dynamic>[],
        "Payments": <dynamic>[]
      }
    ]
  },
  <String, Object>{
=======
  {
>>>>>>> 3c995f2a9a7bdc75699f3fac00fe4428adf8aef0
    "id": 3,
    "sellerId": "seller_003",
    "SellerName": "واحد تولیدی شیرآلات صنعتی",
    "notes": "",
    "date": 1735598400000,
    "Status": 0,
    "totalAmount": 18500000.0,
    "paidAmount": 0.0,
    "paymentStatus": "unpaid",
    "deliveryStatus": "pending",
    "isSettled": false,
<<<<<<< HEAD
    "Deliveries": <dynamic>[],
    "Items": <Map<String, Object>>[
      <String, Object>{
        "id": 207,
        "name": "شیر توپی تمام برنجی 1 اینچ",
        "quantity": 500,
        "price": 25000.0
      },
      <String, Object>{
        "id": 208,
        "name": "شیر توپی تمام برنجی 1/2 اینچ",
        "quantity": 800,
        "price": 18000.0
      }
    ],
    "Payments": <dynamic>[]
  }
=======
    "Deliveries": [],
    "Items": [
      {
        "id": 207,
        "name": "شیر توپی تمام برنجی 1 اینچ",
        "quantity": 500,
        "price": 25000.0,
      },
      {
        "id": 208,
        "name": "شیر توپی تمام برنجی 1/2 اینچ",
        "quantity": 800,
        "price": 18000.0,
      },
    ],
    "Payments": [],
  },
>>>>>>> 3c995f2a9a7bdc75699f3fac00fe4428adf8aef0
];
