part of 'purchase_bloc.dart';

abstract class PurchaseState extends Equatable {
  const PurchaseState();
}

class PurchaseInitial extends PurchaseState {
  @override
  List<Object?> get props => [];
}

class PurchaseLoading extends PurchaseState {
  @override
  List<Object?> get props => [];
}

class PurchaseLoaded extends PurchaseState {
  final List<PurchaseInvoice> invoices;

  const PurchaseLoaded(this.invoices);

  @override
  List<Object?> get props => [invoices];
}

class PurchaseError extends PurchaseState {
  final String message;

  const PurchaseError(this.message);

  @override
  List<Object?> get props => [message];
}