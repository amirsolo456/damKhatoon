import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/features/purchase/data/models/delivery/delivery_model.dart';
import 'package:khatoon_container/features/purchase/data/models/purchase_item/purchase_item_model.dart';
import 'package:khatoon_container/features/purchase/domain/entities/enums.dart';
import 'package:khatoon_container/features/purchase/domain/entities/payment.dart';

part 'payment_model.g.dart';

@JsonSerializable()
class PaymentModel extends Payment {
  @JsonKey(name: 'Deliveries')
  final List<DeliveryModel> deliveryModels;

  @JsonKey(name: 'Items')
  final List<PurchaseItemModel> purchaseItemModels;

  @JsonKey(name: 'Payments')
  final List<PaymentModel> paymentModels;

  const PaymentModel({
    required int id,
    @JsonKey(toJson: _toJson, fromJson: _fromJson)
    required DateTime date,
    @JsonKey(defaultValue: '') String method = '',
    required int sellerId,
    required String sellerName,
    required int status,
    required double totalAmount,
    required double paidAmount,
    required PaymentStatus paymentStatus,
    required DeliveryStatus deliveryStatus,
    required bool isSettled,
    required this.deliveryModels,
    required this.purchaseItemModels,
    required this.paymentModels,
    required String notes,
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

  static int _toJson(DateTime value) => value.millisecondsSinceEpoch;

  static DateTime _fromJson(dynamic value) {
    if (value is int) {
      return DateTime.fromMillisecondsSinceEpoch(value);
    } else if (value is String) {
      return DateTime.parse(value);
    }
    return DateTime.now();
  }

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);


  List<DeliveryModel> get deliveries => deliveryModels;

  List<PurchaseItemModel> get items => purchaseItemModels;

  List<PaymentModel> get innerPayments => paymentModels;
}
