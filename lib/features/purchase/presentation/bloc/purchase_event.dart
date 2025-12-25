
import 'package:equatable/equatable.dart';
import 'package:khatoon_container/features/purchase/data/models/delivery/delivery_model.dart';
import 'package:khatoon_container/features/purchase/data/models/order/order_model.dart';
import 'package:khatoon_container/features/purchase/data/models/payment/payment_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_invoice/purchase_invoice_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_item/purchase_item_model.dart';


abstract class PurchaseEvent extends Equatable {
  const PurchaseEvent();

  @override
  List<Object> get props => <Object>[];
}

// ============ Purchase Invoice Events ============

// Get
class LoadPurchasesEvent extends PurchaseEvent {}

class GetPurchaseByIdEvent extends PurchaseEvent {
  final int id;

  const GetPurchaseByIdEvent(this.id);

  @override
  List<Object> get props => <Object>[id];
}

// Create
class CreatePurchaseEvent extends PurchaseEvent {
  final PurchaseInvoiceModel invoice;

  const CreatePurchaseEvent(this.invoice);

  @override
  List<Object> get props => <Object>[invoice];
}

// Update
class UpdatePurchaseEvent extends PurchaseEvent {
  final PurchaseInvoiceModel invoice;

  const UpdatePurchaseEvent(this.invoice);

  @override
  List<Object> get props => <Object>[invoice];
}

// Delete
class DeletePurchaseEvent extends PurchaseEvent {
  final PurchaseInvoiceModel purchase;

  const DeletePurchaseEvent(this.purchase);

  @override
  List<Object> get props => <Object>[purchase.id];
}

// ============ Purchase Item Events ============

// Get Purchase Items
class GetPurchaseItemsEvent extends PurchaseEvent {
  final PurchaseInvoiceModel purchase;

  const GetPurchaseItemsEvent(this.purchase);

  @override
  List<Object> get props => <Object>[purchase.id];
}

// Create Purchase Item
class CreatePurchaseItemEvent extends PurchaseEvent {
  final PurchaseInvoiceModel purchase;
  final PurchaseItemModel item;

  const CreatePurchaseItemEvent(this.purchase, this.item);

  @override
  List<Object> get props => <Object>[purchase.id, item];
}

// Update Purchase Item
class UpdatePurchaseItemEvent extends PurchaseEvent {
  final PurchaseItemModel item;

  const UpdatePurchaseItemEvent(this.item);

  @override
  List<Object> get props => <Object>[item];
}

// Delete Purchase Item
class DeletePurchaseItemEvent extends PurchaseEvent {
  final PurchaseItemModel item;

  const DeletePurchaseItemEvent(this.item);

  @override
  List<Object> get props => <Object>[item.id];
}

// ============ Payment Events ============

// Get Payments
class GetPaymentsEvent extends PurchaseEvent {
  final PurchaseInvoiceModel invoice;

  const GetPaymentsEvent(this.invoice);

  @override
  List<Object> get props => <Object>[invoice.id];
}

// Create Payment
class CreatePaymentEvent extends PurchaseEvent {
  final PurchaseInvoiceModel invoice;
  final PaymentModel payment;

  const CreatePaymentEvent(this.invoice, this.payment);

  @override
  List<Object> get props => <Object>[invoice.id, payment];
}

// Update Payment
class UpdatePaymentEvent extends PurchaseEvent {
  final PaymentModel payment;

  const UpdatePaymentEvent(this.payment);

  @override
  List<Object> get props => <Object>[payment];
}

// Delete Payment
class DeletePaymentEvent extends PurchaseEvent {
  final PaymentModel payment;

  const DeletePaymentEvent(this.payment);

  @override
  List<Object> get props => <Object>[payment.id];
}

// ============ Order Events ============

// Get Orders
class GetOrdersEvent extends PurchaseEvent {
  final PurchaseInvoiceModel purchase;

  const GetOrdersEvent(this.purchase);

  @override
  List<Object> get props => <Object>[purchase.id];
}

// Create Order
class CreateOrderEvent extends PurchaseEvent {
  final PurchaseInvoiceModel purchase ;
  final OrderModel order;

  const CreateOrderEvent(this.purchase, this.order);

  @override
  List<Object> get props => <Object>[purchase.id, order];
}

// Update Order
class UpdateOrderEvent extends PurchaseEvent {
  final OrderModel order;

  const UpdateOrderEvent(this.order);

  @override
  List<Object> get props => <Object>[order];
}

// Delete Order
class DeleteOrderEvent extends PurchaseEvent {
  final OrderModel order;

  const DeleteOrderEvent(this.order);

  @override
  List<Object> get props => <Object>[order];
}

// ============ Delivery Events ============

// Get Deliveries
class GetDeliveriesEvent extends PurchaseEvent {
  final PurchaseInvoiceModel purchase ;

  const GetDeliveriesEvent(this.purchase);

  @override
  List<Object> get props => <Object>[purchase.id];
}

// Create Delivery
class CreateDeliveryEvent extends PurchaseEvent {
  final PurchaseInvoiceModel purchase;
  final DeliveryModel delivery;

  const CreateDeliveryEvent(this.purchase, this.delivery);

  @override
  List<Object> get props => <Object>[purchase.id, delivery];
}

// Update Delivery
class UpdateDeliveryEvent extends PurchaseEvent {
  final DeliveryModel delivery;

  const UpdateDeliveryEvent(this.delivery);

  @override
  List<Object> get props => <Object>[delivery];
}

// Delete Delivery
class DeleteDeliveryEvent extends PurchaseEvent {
  final DeliveryModel delivery;

  const DeleteDeliveryEvent(this.delivery);

  @override
  List<Object> get props => <Object>[delivery.id];
}