part of 'purchase_bloc.dart';


abstract class PurchaseEvent extends Equatable {
  const PurchaseEvent();
}

class LoadPurchases extends PurchaseEvent {
  @override
  List<Object?> get props => [];
}

class CreatePurchase extends PurchaseEvent {
  final PurchaseInvoice invoice;

  const CreatePurchase(this.invoice);

  @override
  List<Object?> get props => [invoice];
}

class AddPaymentToPurchase extends PurchaseEvent {
  final String invoiceId;
  final Payment payment;

  const AddPaymentToPurchase(this.invoiceId, this.payment);

  @override
  List<Object?> get props => [invoiceId, payment];
}

class AddDeliveryToPurchase extends PurchaseEvent {
  final String invoiceId;
  final Delivery delivery;

  const AddDeliveryToPurchase(this.invoiceId, this.delivery);

  @override
  List<Object?> get props => [invoiceId, delivery];
}