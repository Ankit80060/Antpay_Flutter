// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointBalanceRequestModel _$PointBalanceRequestModelFromJson(
        Map<String, dynamic> json) =>
    PointBalanceRequestModel(
      mobile: json['mobile'] as String?,
      aParam: json['aParam'] as String?,
    );

Map<String, dynamic> _$PointBalanceRequestModelToJson(
        PointBalanceRequestModel instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'aParam': instance.aParam,
    };

PointBalanceResponseModel _$PointBalanceResponseModelFromJson(
        Map<String, dynamic> json) =>
    PointBalanceResponseModel(
      status: json['status'],
      point: json['point'] as String?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$PointBalanceResponseModelToJson(
        PointBalanceResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'point': instance.point,
      'msg': instance.msg,
    };
