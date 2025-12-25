// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map json) => OrderModel(
      id: (json['ID'] as num).toInt(),
      itemId: (json['item_id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      price: Decimal.fromJson(json['price'] as String),
      userRank: $enumDecode(_$UserRankEnumMap, json['user_rank']),
      date: (json['date'] as num).toInt(),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'item_id': instance.itemId,
      'user_id': instance.userId,
      'user_rank': _$UserRankEnumMap[instance.userRank]!,
      'date': instance.date,
      'quantity': instance.quantity,
      'price': instance.price.toJson(),
    };

const _$UserRankEnumMap = {
  UserRank.accountant: 'accountant',
  UserRank.support: 'support',
  UserRank.analyst: 'analyst',
  UserRank.developer: 'developer',
  UserRank.assistant: 'assistant',
  UserRank.user: 'user',
};
