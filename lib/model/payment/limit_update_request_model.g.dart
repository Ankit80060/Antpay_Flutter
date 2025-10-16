// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'limit_update_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LimitUpdateRequest _$LimitUpdateRequestFromJson(Map<String, dynamic> json) =>
    LimitUpdateRequest(
      id: json['id'] as String,
      perTxnLimit: json['perTxnLimit'] as String,
      dailyLimit: json['dailyLimit'] as String,
      monthlyLimit: json['monthlyLimit'] as String,
      yearlyLimit: json['yearlyLimit'] as String,
      limitUpdateId: json['limitUpdateId'] as String? ?? "-1",
      aParam: json['aParam'] as String,
    );

Map<String, dynamic> _$LimitUpdateRequestToJson(LimitUpdateRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'perTxnLimit': instance.perTxnLimit,
      'dailyLimit': instance.dailyLimit,
      'monthlyLimit': instance.monthlyLimit,
      'yearlyLimit': instance.yearlyLimit,
      'limitUpdateId': instance.limitUpdateId,
      'aParam': instance.aParam,
    };

LimitUpdateResponse _$LimitUpdateResponseFromJson(Map<String, dynamic> json) =>
    LimitUpdateResponse(
      responseCode: (json['responseCode'] as num).toInt(),
      responseMessage: json['responseMessage'] as String,
      responseDateTime: json['responseDateTime'] as String,
    );

Map<String, dynamic> _$LimitUpdateResponseToJson(
        LimitUpdateResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'responseDateTime': instance.responseDateTime,
    };
