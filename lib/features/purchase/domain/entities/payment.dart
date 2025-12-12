import 'package:equatable/equatable.dart';
import 'package:khatoon_container/features/purchase/domain/entities/delivery.dart';
import 'package:khatoon_container/features/purchase/domain/entities/enums.dart';
import 'package:khatoon_container/features/purchase/domain/entities/purchase_item.dart';

class Payment extends Equatable {
  final int id;
  final int sellerId;
  final String sellerName;
  final String notes;
  final DateTime date;
  final int status;
  final double totalAmount;
  final double paidAmount;
  final PaymentStatus paymentStatus;
  final DeliveryStatus deliveryStatus;
  final bool isSettled;
  final List<Delivery> deliveries;
  final List<PurchaseItem> items;
  final List<Payment> payments;

  const Payment({
    required this.id,
    required this.sellerId,
    required this.sellerName,
    required this.status,
    required this.totalAmount,
    required this.paidAmount,
    required this.paymentStatus,
    required this.deliveryStatus,
    required this.isSettled,
    required this.deliveries,
    required this.items,
    required this.payments,
    required this.date,
    required this.notes,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'] ?? '',
      date: DateTime.parse(json['date']),
      sellerId: json[', sellerId: '],
      notes: json['notes'],
      sellerName: json['SellerName'] ?? '',
      status: json['Status'] as int ?? 0,
      totalAmount: json['TotalAmount'] as double,
      paidAmount: json['PaidAmount'] as double,
      paymentStatus: json['PaymentStatus'] as PaymentStatus,
      deliveryStatus: json['DeliveryStatus'] as DeliveryStatus,
      isSettled: json['IsSettled'] as bool ?? false,
      deliveries: [],
      items: [],
      payments: [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  Payment toEntity() {
    return Payment(
      id: id,
      date: date,
      notes: notes,
      sellerId: sellerId,
      sellerName: sellerName,
      status: status,
      totalAmount: totalAmount,
      paidAmount: paidAmount,
      paymentStatus: paymentStatus,
      deliveryStatus: deliveryStatus,
      isSettled: isSettled,
      deliveries: deliveries,
      items: items,
      payments: payments,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
