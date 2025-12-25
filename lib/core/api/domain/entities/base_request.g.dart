// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseRequest _$BaseRequestFromJson(Map json) => BaseRequest(
      defaults: json['defaults'] == null
          ? null
          : Defaults.fromJson(
              Map<String, dynamic>.from(json['defaults'] as Map)),
      orderInfo: json['order_info'] == null
          ? null
          : OrderInfo.fromJson(
              Map<String, dynamic>.from(json['order_info'] as Map)),
      filters: json['filters'] == null
          ? null
          : Filters.fromJson(Map<String, dynamic>.from(json['filters'] as Map)),
    )..pagingInfo = json['paging_info'] == null
        ? null
        : PagingInfo.fromJson(
            Map<String, dynamic>.from(json['paging_info'] as Map));

Map<String, dynamic> _$BaseRequestToJson(BaseRequest instance) =>
    <String, dynamic>{
      'filters': instance.filters?.toJson(),
      'paging_info': instance.pagingInfo?.toJson(),
      'order_info': instance.orderInfo?.toJson(),
      'defaults': instance.defaults?.toJson(),
    };
