import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/features/purchase/data/models/delivery/delivery_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_item/purchase_item_model.dart';
import 'package:khatoon_container/features/purchase/domain/entities/enums.dart';
import 'package:khatoon_container/features/purchase/domain/entities/payment.dart';

part 'payment_model.g.dart';

@JsonSerializable()
class PaymentModel extends Payment {
  // @JsonKey(name: 'ID', fromJson: _idFromJson, toJson: _idToJson)
  @override
  final int id;

  @override
  final int date;

  @JsonKey(name: 'method', defaultValue: '')
  final String method;

  @override
  @JsonKey(name: 'sellerId')
  final String sellerId; // JSON شما عدد است، پس باید int باشد نه String

  @override
  @JsonKey(name: 'sellerName', defaultValue: '')
  final String sellerName;

  @override
  @JsonKey(name: 'status', defaultValue: 0)
  final int status;

  @override
  @JsonKey(name: 'totalAmount', defaultValue: 0.0)
  final double totalAmount;

  @override
  @JsonKey(name: 'paidAmount', defaultValue: 0.0)
  final double paidAmount;

  @override
  @JsonKey(name: 'paymentStatus', defaultValue: PaymentStatus.unpaid)
  final PaymentStatus paymentStatus;

  @override
  @JsonKey(name: 'deliveryStatus', defaultValue: DeliveryStatus.pending)
  final DeliveryStatus deliveryStatus;

  @override
  @JsonKey(name: 'isSettled', defaultValue: false)
  final bool isSettled;

  @override
  @JsonKey(name: 'notes', defaultValue: '')
  final String notes;

  @JsonKey(name: 'Deliveries', defaultValue: [])
  final List<DeliveryModel> deliveryModels;

  @JsonKey(name: 'Items', defaultValue: [])
  final List<PurchaseItemModel> purchaseItemModels;

  @JsonKey(name: 'Payments', defaultValue: [])
  final List<PaymentModel> paymentModels;

  const PaymentModel({
    required this.deliveryModels,
    required this.purchaseItemModels,
    required this.paymentModels,
    required this.id,
    required this.date,
    required this.method,
    required this.sellerId,
    required this.sellerName,
    required this.status,
    required this.totalAmount,
    required this.paidAmount,
    required this.paymentStatus,
    required this.deliveryStatus,
    required this.isSettled,
    required this.notes,
  }) : super(
         id: id,
         date: date,
         sellerId: sellerId,
         sellerName: sellerName,
         status: status,
         totalAmount: totalAmount,
         paidAmount: paidAmount,
         paymentStatus: paymentStatus,
         deliveryStatus: deliveryStatus,
         isSettled: isSettled,
         deliveries: deliveryModels,
         // ارسال به عنوان List<dynamic>
         items: purchaseItemModels,
         // ارسال به عنوان List<dynamic>
         payments: paymentModels,
         // ارسال به عنوان List<dynamic>
         notes: notes,
       );

  static int _toJson(int value) => value;

  static int _fromJson(dynamic value) {
    return value;
    // if (value is int) {
    //   return DateTime.fromMillisecondsSinceEpoch(value);
    // } else if (value is String) {
    //   return DateTime.parse(value);
    // }
    // return DateTime.now();
  }

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);

  @override
  List<DeliveryModel> get deliveries => deliveryModels;

  @override
  List<PurchaseItemModel> get items => purchaseItemModels;

  List<PaymentModel> get innerPayments => paymentModels;
}
