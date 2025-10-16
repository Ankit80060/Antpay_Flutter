// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_number_check_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MobileNumberCheckRequestModel _$MobileNumberCheckRequestModelFromJson(
        Map<String, dynamic> json) =>
    MobileNumberCheckRequestModel(
      mobile: json['mobile'] as String?,
      aParam: json['aParam'] as String?,
    );

Map<String, dynamic> _$MobileNumberCheckRequestModelToJson(
        MobileNumberCheckRequestModel instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'aParam': instance.aParam,
    };

MobileNumberCheckResponseModel _$MobileNumberCheckResponseModelFromJson(
        Map<String, dynamic> json) =>
    MobileNumberCheckResponseModel(
      number: json['Number'] as String?,
      company: json['company'] as String?,
      state: json['state'] as String?,
      ported: json['ported'],
      transactionId: json['TransactionID'],
      status: json['Status'],
      utransactionId: json['UtransactionID'] as String?,
      resposneMessage: json['ResposneMessage'] as String?,
    );

Map<String, dynamic> _$MobileNumberCheckResponseModelToJson(
        MobileNumberCheckResponseModel instance) =>
    <String, dynamic>{
      'Number': instance.number,
      'company': instance.company,
      'state': instance.state,
      'ported': instance.ported,
      'TransactionID': instance.transactionId,
      'UtransactionID': instance.utransactionId,
      'Status': instance.status,
      'ResposneMessage': instance.resposneMessage,
    };
