// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_card_limit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchCardLimitReqModel _$FetchCardLimitReqModelFromJson(
        Map<String, dynamic> json) =>
    FetchCardLimitReqModel(
      customerId: json['customerId'] as String?,
      urn: json['urn'] as String?,
      aParam: json['aParam'] as String?,
    );

Map<String, dynamic> _$FetchCardLimitReqModelToJson(
        FetchCardLimitReqModel instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'urn': instance.urn,
      'aParam': instance.aParam,
    };

FetchCardLimitResModel _$FetchCardLimitResModelFromJson(
        Map<String, dynamic> json) =>
    FetchCardLimitResModel(
      responseCode: (json['responseCode'] as num?)?.toInt(),
      responseMessage: json['responseMessage'] as String?,
      responseDateTime: json['responseDateTime'] as String?,
    );

Map<String, dynamic> _$FetchCardLimitResModelToJson(
        FetchCardLimitResModel instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'responseDateTime': instance.responseDateTime,
    };
