import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/features/purchase/domain/entities/enums.dart';
import '../../../domain/entities/purchase_invoice.dart';
import '../payment/payment_model.dart';
import '../delivery/delivery_model.dart';
import '../purchase_item/purchase_item_model.dart';

part 'purchase_invoice_model.g.dart';

@JsonSerializable()
class PurchaseInvoiceModel extends PurchaseInvoice {
  final List<DeliveryModel> deliveries;
  final List<PurchaseItemModel> items;
  final List<PaymentModel> payments;
  final String sellerId;
  final String sellerName;
  final String notes;
  final double totalAmount;
  final double paidAmount;

  const PurchaseInvoiceModel({
    required int id,
    required int date,
    required int status,
    @JsonEnum(alwaysCreate: true) required PaymentStatus paymentStatus,
    @JsonEnum(alwaysCreate: true) required DeliveryStatus deliveryStatus,
    required bool isSettled,
    required this.deliveries,
    required this.items,
    required this.payments,
    required this.sellerId,
    required this.sellerName,
    required this.notes,
    required this.totalAmount,
    required this.paidAmount,
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

  // static int _toJson(DateTime value) => value.millisecondsSinceEpoch;
  //
  // static DateTime _fromJson(dynamic value) {
  //   if (value is int) {
  //     return DateTime.fromMillisecondsSinceEpoch(value);
  //   } else if (value is String) {
  //     return DateTime.parse(value);
  //   }
  //   return DateTime.now();
  // }

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
      id: json['id'] as int,
      sellerId: json['sellerId'] as String,
      sellerName: json['SellerName'] ?? '',
      notes: json['notes'] ?? '',
      date:  (json['date'] as int),
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
      'date': date ,
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
