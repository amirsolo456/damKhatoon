// مدل خرید/فروش
import 'package:equatable/equatable.dart';
import 'package:khatoon_container/features/animal/domain/entities/enums.dart';

class TransactionRecord extends Equatable {
  final String id;
  final DateTime date;
  final TransactionType type;
  final double price;
  final String? buyerSeller;
  final String? contactInfo;
  final String? reason;
  final String? notes;

  const TransactionRecord({
    required this.id,
    required this.date,
    required this.type,
    required this.price,
    this.buyerSeller,
    this.contactInfo,
    this.reason,
    this.notes,
  });

  @override
  List<Object?> get props => <Object?>[id, date, type, price];
}