// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map json) => UserModel()
  ..id = (json['id'] as num).toInt()
  ..username = json['username'] as String?
  ..password = json['password'] as String?
  ..email = json['email'] as String?
  ..lastLogin = (json['last_login'] as num?)?.toInt()
  ..dataCreated = (json['data_created'] as num?)?.toInt()
  ..rank = $enumDecode(_$UserRankEnumMap, json['rank'])
  ..name = json['name'] as String?
  ..age = (json['age'] as num?)?.toInt();

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'last_login': instance.lastLogin,
      'data_created': instance.dataCreated,
      'rank': _$UserRankEnumMap[instance.rank]!,
      'name': instance.name,
      'age': instance.age,
    };

const _$UserRankEnumMap = {
  UserRank.accountant: 'accountant',
  UserRank.support: 'support',
  UserRank.analyst: 'analyst',
  UserRank.developer: 'developer',
  UserRank.assistant: 'assistant',
  UserRank.user: 'user',
};
