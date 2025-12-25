import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/features/purchase/domain/entities/enums.dart';
import 'package:khatoon_container/features/purchase/domain/entities/purchase_invoice.dart';
import 'package:khatoon_container/features/purchase/data/models/payment/payment_model.dart';
import 'package:khatoon_container/features/purchase/data/models/delivery/delivery_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_item/purchase_item_model.dart';

part 'purchase_invoice_model.g.dart';

@JsonSerializable()
class PurchaseInvoiceModel extends PurchaseInvoice {
  @override
  final List<DeliveryModel> deliveries;
  @override
  final List<PurchaseItemModel> items;
  @override
  final List<PaymentModel> payments;
  @override
  final String sellerId;
  @override
  final String sellerName;
  @override
  final String notes;
  @override
  final double totalAmount;
  @override
  final double paidAmount;

  const PurchaseInvoiceModel({
    required super.id,
    required super.date,
    required super.status,
    @JsonEnum(alwaysCreate: true) required super.paymentStatus,
    @JsonEnum(alwaysCreate: true) required super.deliveryStatus,
    required super.isSettled,
    required this.deliveries,
    required this.items,
    required this.payments,
    required this.sellerId,
    required this.sellerName,
    required this.notes,
    required this.totalAmount,
    required this.paidAmount,
  }) : super(
         sellerId: sellerId,
         sellerName: sellerName,
         notes: notes,
         totalAmount: totalAmount,
         paidAmount: paidAmount,
         deliveries: deliveries,
         items: items,
         payments: payments,
       );

  // تبدیل از JSON به مدل
  factory PurchaseInvoiceModel.fromJson(Map<String, dynamic> json) {
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
    List<PaymentModel> payments = <PaymentModel>[];
    if (json['Payments'] != null && json['Payments'] is List) {
      payments = (json['Payments'] as List)
          .map((paymentJson) => PaymentModel.fromJson(paymentJson))
          .toList();
    }

    // تبدیل deliveries از لیست JSON
    List<DeliveryModel> deliveries = <DeliveryModel>[];
    if (json['Deliveries'] != null && json['Deliveries'] is List) {
      deliveries = (json['Deliveries'] as List)
          .map((deliveryJson) => DeliveryModel.fromJson(deliveryJson))
          .toList();
    }

    // تبدیل items از لیست JSON
    List<PurchaseItemModel> items = <PurchaseItemModel>[];
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
    return <String, dynamic>{
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
      'Deliveries': deliveries.map((DeliveryModel d) => d).toList(),
      'Items': items.map((PurchaseItemModel i) => i).toList(),
      'Payments': payments.map((PaymentModel p) => p.toJson()).toList(),
    };
  }
}
