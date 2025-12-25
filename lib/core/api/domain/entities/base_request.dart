
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:khatoon_container/core/api/domain/entities/defaults.dart';
import 'package:khatoon_container/core/api/domain/entities/filters.dart';
import 'package:khatoon_container/core/api/domain/entities/order_info.dart';
import 'package:khatoon_container/core/api/domain/entities/paging_info.dart';

part 'base_request.g.dart';

@JsonSerializable()
class BaseRequest extends Equatable {
  Filters? filters;
  PagingInfo? pagingInfo;
  OrderInfo? orderInfo;
  Defaults? defaults;

  BaseRequest({this.defaults, this.orderInfo, this.filters});

  factory BaseRequest.fromJson(Map<String, dynamic> json) =>
      _$BaseRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BaseRequestToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
