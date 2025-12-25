// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sale _$SaleFromJson(Map json) => Sale(
      purchaseOrder: Order.fromJson(json['purchase_order'] as Map),
      invoices: (json['invoices'] as List<dynamic>)
          .map((e) =>
              PurchaseInvoice.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      deliveries: (json['deliveries'] as List<dynamic>)
          .map((e) => Delivery.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      payments: (json['payments'] as List<dynamic>)
          .map((e) => Payment.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$SaleToJson(Sale instance) => <String, dynamic>{
      'purchase_order': instance.purchaseOrder.toJson(),
      'invoices': instance.invoices.map((e) => e.toJson()).toList(),
      'deliveries': instance.deliveries.map((e) => e.toJson()).toList(),
      'payments': instance.payments.map((e) => e.toJson()).toList(),
    };
