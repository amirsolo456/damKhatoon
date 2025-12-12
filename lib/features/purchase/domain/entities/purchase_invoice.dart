import 'package:equatable/equatable.dart';
import 'package:khatoon_container/features/purchase/domain/entities/delivery.dart';
import 'package:khatoon_container/features/purchase/domain/entities/enums.dart';
import 'package:khatoon_container/features/purchase/domain/entities/payment.dart';
import 'package:khatoon_container/features/purchase/domain/entities/purchase_item.dart';

class PurchaseInvoice extends Equatable {
  final int id;
  final String sellerId;
  final String sellerName;
  final DateTime date;
  final double totalAmount;
  final double paidAmount;
  final PaymentStatus paymentStatus; // 'paid', 'partial', 'unpaid'
  final DeliveryStatus deliveryStatus; // 'delivered', 'partial', 'pending'
  final bool isSettled;
  final int status;
  final List<PurchaseItem> items;
  final List<Payment> payments;
  final List<Delivery> deliveries;
  final String notes;

  const PurchaseInvoice({
    required this.id,
    required this.sellerId,
    required this.sellerName,
    required this.notes,
    required this.date,
    required this.status,
    required this.totalAmount,
    required this.paidAmount,
    required this.paymentStatus,
    required this.deliveryStatus,
    required this.isSettled,
    required this.deliveries,
    required this.items,
    required this.payments,
  });

  @override
  List<Object?> get props => [
    id,
    sellerId,
    sellerName,
    notes,
    date,
    status,
    totalAmount,
    paidAmount,
    paymentStatus,
    deliveryStatus,
    isSettled,
    deliveries,
    items,
    payments,
  ];

  /// مبلغ باقی‌مانده = کل مبلغ - مبلغ پرداخت شده
  double get remainingAmount => totalAmount - paidAmount;

  /// آیا پرداخت کامل شده؟
  bool get isPaidInFull => remainingAmount <= 0;

  PurchaseInvoice copyWith({
    int? id,
    String? sellerId,
    DateTime? date,
    double? totalAmount,
    double? paidAmount,
    PaymentStatus? paymentStatus,
    DeliveryStatus? deliveryStatus,
    bool? isSettled,
    int? status,
    List<Delivery>? deliveries,
    List<Payment>? payments,
    List<PurchaseItem>? items,
  }) {
    return PurchaseInvoice(
      id: id ?? this.id,
      sellerId: sellerId ?? this.sellerId,
      date: date ?? this.date,
      totalAmount: totalAmount ?? this.totalAmount,
      paidAmount: paidAmount ?? this.paidAmount,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      deliveryStatus: deliveryStatus ?? this.deliveryStatus,
      isSettled: isSettled ?? this.isSettled,
      status: status ?? this.status,
      sellerName: sellerName,
      payments: payments ?? this.payments,
      deliveries: deliveries ?? this.deliveries,
      items: items ?? this.items,
      notes: '',
    );
  }

  factory PurchaseInvoice.fromJson(Map<String, dynamic> json) {
    return PurchaseInvoice(
      id: json['id'],
      sellerId: json['sellerId'],
      date: DateTime.parse(json['date']),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      paidAmount: (json['paidAmount'] as num).toDouble(),
      paymentStatus: PaymentStatus.values.firstWhere(
        (e) => e.name == json['paymentStatus'],
        orElse: () => PaymentStatus.unpaid,
      ),
      deliveryStatus: DeliveryStatus.values.firstWhere(
        (e) => e.name == json['deliveryStatus'],
        orElse: () => DeliveryStatus.pending,
      ),
      isSettled: json['isSettled'] ?? false,
      sellerName: json['SellerName'] ?? '',
      status: json['Status'] ?? 0,
      deliveries: json['Deliveries'] ?? [],
      payments: json['Payments'] ?? [],
      items: json['Items'] ?? [],
      notes: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'SellerId': sellerId,
      'Date': date.toIso8601String(),
      'TotalAmount': totalAmount,
      'PaidAmount': paidAmount,
      'PaymentStatus': paymentStatus.name,
      'DeliveryStatus': deliveryStatus.name,
      'IsSettled': isSettled,
      'Deliveries': deliveries,
      'Payments': payments,
      'SellerName': sellerName,
      'Items': items,
    };
  }
}
