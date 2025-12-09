// features/purchase/data/models/purchase_invoice_model.dart
import 'package:khatoon_container/features/purchase/domain/entities/enums.dart';

import '../../domain/entities/purchase_invoice.dart';
import 'payment_model.dart';
import 'delivery_model.dart';
import 'purchase_item_model.dart';

class PurchaseInvoiceModel extends PurchaseInvoice {
  const PurchaseInvoiceModel({
    required String id,
    required String sellerId,
    required String sellerName,
    required String notes,
    required DateTime date,
    required int status,
    required double totalAmount,
    required double paidAmount,
    required PaymentStatus paymentStatus,
    required DeliveryStatus deliveryStatus,
    required bool isSettled,
    required List<DeliveryModel> deliveries,
    required List<PurchaseItemModel> items,
    required List<PaymentModel> payments,
  }) : super(
         id: id,
         sellerId: sellerId,
         sellerName: sellerName,
         notes: notes,
         date: date,
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

  // تبدیل از JSON به مدل
  factory PurchaseInvoiceModel.fromJson(Map<String, dynamic> json) {
    // تبدیل paymentStatus از String به enum
    PaymentStatus paymentStatus;
    switch (json['paymentStatus']) {
      case 'unpaid':
        paymentStatus = PaymentStatus.unpaid;
        break;
      case 'partial':
        paymentStatus = PaymentStatus.partial;
        break;
      case 'paid':
        paymentStatus = PaymentStatus.paid;
        break;
      default:
        paymentStatus = PaymentStatus.unpaid;
    }

    // تبدیل deliveryStatus از String به enum
    DeliveryStatus deliveryStatus;
    switch (json['deliveryStatus']) {
      case 'pending':
        deliveryStatus = DeliveryStatus.pending;
        break;
      case 'shipped':
        deliveryStatus = DeliveryStatus.shipped;
        break;
      case 'delivered':
        deliveryStatus = DeliveryStatus.delivered;
        break;
      default:
        deliveryStatus = DeliveryStatus.pending;
    }

    // تبدیل payments از لیست JSON
    List<PaymentModel> payments = [];
    if (json['Payments'] != null && json['Payments'] is List) {
      payments = (json['Payments'] as List)
          .map((paymentJson) => PaymentModel.fromJson(paymentJson))
          .toList();
    }

    // تبدیل deliveries از لیست JSON
    List<DeliveryModel> deliveries = [];
    if (json['Deliveries'] != null && json['Deliveries'] is List) {
      deliveries = (json['Deliveries'] as List)
          .map((deliveryJson) => DeliveryModel.fromJson(deliveryJson))
          .toList();
    }

    // تبدیل items از لیست JSON
    List<PurchaseItemModel> items = [];
    if (json['Items'] != null && json['Items'] is List) {
      items = (json['Items'] as List)
          .map((itemJson) => PurchaseItemModel.fromJson(itemJson))
          .toList();
    }

    return PurchaseInvoiceModel(
      id: json['id'] as String,
      sellerId: json['sellerId'] as String,
      sellerName: json['SellerName'] ?? '',
      notes: json['notes'] ?? '',
      date: DateTime.parse(json['date'] as String),
      status: (json['Status'] ?? 0) as int,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      paidAmount: (json['paidAmount'] as num).toDouble(),
      paymentStatus: paymentStatus,
      deliveryStatus: deliveryStatus,
      isSettled: (json['isSettled'] ?? false) as bool,
      deliveries: deliveries,
      items: items,
      payments: payments,
    );
  }

  // تبدیل از مدل به JSON
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sellerId': sellerId,
      'SellerName': sellerName,
      'notes': notes,
      'date': date.toIso8601String(),
      'Status': status,
      'totalAmount': totalAmount,
      'paidAmount': paidAmount,
      'paymentStatus': paymentStatus.toString().split('.').last,
      'deliveryStatus': deliveryStatus.toString().split('.').last,
      'isSettled': isSettled,
      'Deliveries': deliveries.map((d) => d).toList(),
      'Items': items.map((i) => i).toList(),
      'Payments': payments.map((p) => p.toJson()).toList(),
    };
  }
}
