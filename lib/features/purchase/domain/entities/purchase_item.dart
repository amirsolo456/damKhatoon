// features/purchase/domain/entities/purchase_item.dart
import 'package:equatable/equatable.dart';

class PurchaseItem extends Equatable {
  final int id;
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
  List<Object?> get props => <Object?>[id, name, quantity, price];
}