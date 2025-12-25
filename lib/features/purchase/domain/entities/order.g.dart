// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map json) => Order(
      id: (json['ID'] as num).toInt(),
      date: (json['date'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      totalWeight: (json['total_weight'] as num).toDouble(),
      itemId: (json['item_id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      userRank: $enumDecode(_$UserRankEnumMap, json['user_rank']),
      price: Decimal.fromJson(json['price'] as String),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'ID': instance.id,
      'item_id': instance.itemId,
      'user_id': instance.userId,
      'user_rank': _$UserRankEnumMap[instance.userRank]!,
      'date': instance.date,
      'quantity': instance.quantity,
      'price': instance.price.toJson(),
      'total_weight': instance.totalWeight,
    };

const _$UserRankEnumMap = {
  UserRank.accountant: 'accountant',
  UserRank.support: 'support',
  UserRank.analyst: 'analyst',
  UserRank.developer: 'developer',
  UserRank.assistant: 'assistant',
  UserRank.user: 'user',
};
