// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map json) => PaymentModel(
      deliveryModels: (json['Deliveries'] as List<dynamic>?)
              ?.map((e) =>
                  DeliveryModel.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      purchaseItemModels: (json['Items'] as List<dynamic>?)
              ?.map((e) => PurchaseItemModel.fromJson(
                  Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      paymentModels: (json['Payments'] as List<dynamic>?)
              ?.map((e) =>
                  PaymentModel.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList() ??
          [],
      id: (json['id'] as num).toInt(),
      date: (json['date'] as num).toInt(),
      method: json['method'] as String? ?? '',
      sellerId: json['sellerId'] as String,
      sellerName: json['sellerName'] as String? ?? '',
      status: (json['status'] as num?)?.toInt() ?? 0,
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0.0,
      paidAmount: (json['paidAmount'] as num?)?.toDouble() ?? 0.0,
      paymentStatus:
          $enumDecodeNullable(_$PaymentStatusEnumMap, json['paymentStatus']) ??
              PaymentStatus.unpaid,
      deliveryStatus: $enumDecodeNullable(
              _$DeliveryStatusEnumMap, json['deliveryStatus']) ??
          DeliveryStatus.pending,
      isSettled: json['isSettled'] as bool? ?? false,
      notes: json['notes'] as String? ?? '',
    );

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'method': instance.method,
      'sellerId': instance.sellerId,
      'sellerName': instance.sellerName,
      'status': instance.status,
      'totalAmount': instance.totalAmount,
      'paidAmount': instance.paidAmount,
      'paymentStatus': _$PaymentStatusEnumMap[instance.paymentStatus]!,
      'deliveryStatus': _$DeliveryStatusEnumMap[instance.deliveryStatus]!,
      'isSettled': instance.isSettled,
      'notes': instance.notes,
      'Deliveries': instance.deliveryModels.map((e) => e.toJson()).toList(),
      'Items': instance.purchaseItemModels.map((e) => e.toJson()).toList(),
      'Payments': instance.paymentModels.map((e) => e.toJson()).toList(),
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
