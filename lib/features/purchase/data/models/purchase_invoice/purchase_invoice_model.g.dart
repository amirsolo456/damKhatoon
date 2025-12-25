// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseInvoiceModel _$PurchaseInvoiceModelFromJson(Map json) =>
    PurchaseInvoiceModel(
      id: (json['id'] as num).toInt(),
      date: (json['date'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      paymentStatus:
          $enumDecode(_$PaymentStatusEnumMap, json['payment_status']),
      deliveryStatus:
          $enumDecode(_$DeliveryStatusEnumMap, json['delivery_status']),
      isSettled: json['is_settled'] as bool,
      deliveries: (json['deliveries'] as List<dynamic>)
          .map((e) =>
              DeliveryModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              PurchaseItemModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      payments: (json['payments'] as List<dynamic>)
          .map(
              (e) => PaymentModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      sellerId: json['seller_id'] as String,
      sellerName: json['seller_name'] as String,
      notes: json['notes'] as String,
      totalAmount: (json['total_amount'] as num).toDouble(),
      paidAmount: (json['paid_amount'] as num).toDouble(),
    );

Map<String, dynamic> _$PurchaseInvoiceModelToJson(
        PurchaseInvoiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'payment_status': _$PaymentStatusEnumMap[instance.paymentStatus]!,
      'delivery_status': _$DeliveryStatusEnumMap[instance.deliveryStatus]!,
      'is_settled': instance.isSettled,
      'status': instance.status,
      'deliveries': instance.deliveries.map((e) => e.toJson()).toList(),
      'items': instance.items.map((e) => e.toJson()).toList(),
      'payments': instance.payments.map((e) => e.toJson()).toList(),
      'seller_id': instance.sellerId,
      'seller_name': instance.sellerName,
      'notes': instance.notes,
      'total_amount': instance.totalAmount,
      'paid_amount': instance.paidAmount,
    };

const _$PaymentStatusEnumMap = {
  PaymentStatus.unpaid: 'unpaid',
  PaymentStatus.partial: 'partial',
  PaymentStatus.paid: 'paid',
};

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.pending: 'pending',
  DeliveryStatus.shipped: 'shipped',
  DeliveryStatus.delivered: 'delivered',
};
