// features/purchase/domain/entities/purchase_item.dart
import 'package:equatable/equatable.dart';

class PurchaseItem extends Equatable {
  final String id;
  final String name;
  final int quantity;
  final double price;

  const PurchaseItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  @override
  List<Object?> get props => [id, name, quantity, price];
}