// features/purchase/data/models/payment_model.dart
import 'package:khatoon_container/features/purchase/domain/entities/enums.dart';

import '../../domain/entities/payment.dart';

class PaymentModel extends Payment {
  const PaymentModel({
    required String id,
    required DateTime date,
    required double amount,
    required String method,
    required super.sellerId,
    required super.sellerName,
    required super.status,
    required super.totalAmount,
    required super.paidAmount,
    required super.paymentStatus,
    required super.deliveryStatus,
    required super.isSettled,
    required super.deliveries,
    required super.items,
    required super.payments,
    required super.notes,
  }) : super(id: '', date: date);

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      amount: (json['amount'] as num).toDouble(),
      method: json['method'] as String,
      sellerId: json['SellerIde'] as String,
      sellerName: json['SellerName'] as String,
      status: json['Status'] as int,
      totalAmount: json['TotalAmount'] as double,
      paidAmount: json['PaidAmount'] as double,
      paymentStatus: json['PaymentStatus'] as PaymentStatus,
      deliveryStatus: json['DeliveryStatus'] as DeliveryStatus,
      isSettled: json['IsSettled'] as bool,
      deliveries: [],
      items: [],
      payments: [],
      notes: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'date': date.toIso8601String()};
  }
}
