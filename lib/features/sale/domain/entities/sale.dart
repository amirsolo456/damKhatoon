// مدل جامع‌تر
import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/features/purchase/domain/entities/delivery.dart';
import 'package:khatoon_container/features/purchase/domain/entities/order.dart';
import 'package:khatoon_container/features/purchase/domain/entities/payment.dart';
import 'package:khatoon_container/features/purchase/domain/entities/purchase_invoice.dart';

part 'sale.g.dart';

@JsonSerializable()
class Sale {
  final Order purchaseOrder;
  final List<PurchaseInvoice> invoices;
  final List<Delivery> deliveries;
  final List<Payment> payments;

  const Sale({
    required this.purchaseOrder,
    required this.invoices,
    required this.deliveries,
    required this.payments,
  });

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

  factory Sale.fromJson(Map<String, dynamic> json) => _$SaleFromJson(json);

  Map<String, dynamic> toJson() => _$SaleToJson(this);
}
