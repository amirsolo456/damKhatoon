import 'package:equatable/equatable.dart';
import 'package:khatoon_container/features/purchase/data/models/delivery/delivery_model.dart';
import 'package:khatoon_container/features/purchase/data/models/order/order_model.dart';
import 'package:khatoon_container/features/purchase/data/models/payment/payment_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_item/purchase_item_model.dart';


abstract class PurchaseState extends Equatable {
  const PurchaseState();

  @override
  List<Object> get props => [];
}

// Initial
class PurchaseInitial extends PurchaseState {}

// Loading States
class PurchaseLoading extends PurchaseState {}
class PurchaseItemsLoading extends PurchaseState {}
class PaymentsLoading extends PurchaseState {}
class OrdersLoading extends PurchaseState {}
class DeliveriesLoading extends PurchaseState {}

// Loaded States
class PurchasesLoadedState extends PurchaseState {
  final List<PurchaseInvoiceModel> invoices;

  const PurchasesLoadedState(this.invoices);

  @override
  List<Object> get props => [invoices];
}

class PurchaseByIdLoaded extends PurchaseState {
  final List<PurchaseInvoiceModel> invoice;

  const PurchaseByIdLoaded(this.invoice);

  @override
  List<Object> get props => [invoice];
}

class PurchaseItemsLoadedState extends PurchaseState {
  final List<PurchaseItemModel> items;

  const PurchaseItemsLoadedState(this.items);

  @override
  List<Object> get props => [items];
}

class PaymentsLoadedState extends PurchaseState {
  final List<PaymentModel> payments;

  const PaymentsLoadedState(this.payments);

  @override
  List<Object> get props => [payments];
}

class OrdersLoadedState extends PurchaseState {
  final List<OrderModel> orders;

  const OrdersLoadedState(this.orders);

  @override
  List<Object> get props => [orders];
}

class DeliveriesLoadedState extends PurchaseState {
  final List<DeliveryModel> deliveries;

  const DeliveriesLoadedState(this.deliveries);

  @override
  List<Object> get props => [deliveries];
}

// Success States
class PurchaseCreatedState extends PurchaseState {
  final PurchaseInvoiceModel purchase;

  const PurchaseCreatedState(this.purchase);

  @override
  List<Object> get props => [purchase.id];
}

class PurchaseUpdatedState extends PurchaseState {
  final PurchaseInvoiceModel invoice;

  const PurchaseUpdatedState(this.invoice);

  @override
  List<Object> get props => [invoice];
}

class PurchaseDeletedState extends PurchaseState {
  final PurchaseInvoiceModel purchase;

  const PurchaseDeletedState(this.purchase);

  @override
  List<Object> get props => [purchase.id];
}

class PurchaseItemCreatedState extends PurchaseState {
  final PurchaseItemModel item;

  const PurchaseItemCreatedState(this.item);

  @override
  List<Object> get props => [item];
}

class PurchaseItemUpdatedState extends PurchaseState {
  final PurchaseItemModel item;

  const PurchaseItemUpdatedState(this.item);

  @override
  List<Object> get props => [item];
}

class PurchaseItemDeletedState extends PurchaseState {
  final PurchaseItemModel item;

  const PurchaseItemDeletedState(this.item);

  @override
  List<Object> get props => [item.id];
}

class PaymentCreatedState extends PurchaseState {
  final PaymentModel payment;

  const PaymentCreatedState(this.payment);

  @override
  List<Object> get props => [payment];
}

class PaymentUpdatedState extends PurchaseState {
  final PaymentModel payment;

  const PaymentUpdatedState(this.payment);

  @override
  List<Object> get props => [payment];
}

class PaymentDeletedState extends PurchaseState {
  final PaymentModel payment;

  const PaymentDeletedState(this.payment);

  @override
  List<Object> get props => [payment.id];
}

class OrderCreatedState extends PurchaseState {
  final OrderModel order;

  const OrderCreatedState(this.order);

  @override
  List<Object> get props => [order];
}

class OrderUpdatedState extends PurchaseState {
  final OrderModel order;

  const OrderUpdatedState(this.order);

  @override
  List<Object> get props => [order];
}

class OrderDeletedState extends PurchaseState {
  final OrderModel order;

  const OrderDeletedState(this.order);

  @override
  List<Object> get props => [order.id];
}

class DeliveryCreatedState extends PurchaseState {
  final DeliveryModel delivery;

  const DeliveryCreatedState(this.delivery);

  @override
  List<Object> get props => [delivery];
}

class DeliveryUpdatedState extends PurchaseState {
  final DeliveryModel delivery;

  const DeliveryUpdatedState(this.delivery);

  @override
  List<Object> get props => [delivery];
}

class DeliveryDeletedState extends PurchaseState {
  final int deliveryId;

  const DeliveryDeletedState(this.deliveryId);

  @override
  List<Object> get props => [deliveryId];
}

// Error States
class PurchaseErrorState extends PurchaseState {
  final String message;

  const PurchaseErrorState(this.message);

  @override
  List<Object> get props => [message];
}