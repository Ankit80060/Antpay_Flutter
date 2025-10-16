// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_score_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditScoreRequest _$CreditScoreRequestFromJson(Map<String, dynamic> json) =>
    CreditScoreRequest(
      fname: json['fname'] as String,
      lname: json['lname'] as String,
      userId: json['user_id'] as String,
      aParam: json['aParam'] as String,
      experianSource: json['experian_source'] as String,
      mobileNo: json['mobileNo'] as String,
      creditScoreRequestType: json['creditScoreRequestType'] as String,
    );

Map<String, dynamic> _$CreditScoreRequestToJson(CreditScoreRequest instance) =>
    <String, dynamic>{
      'fname': instance.fname,
      'lname': instance.lname,
      'user_id': instance.userId,
      'aParam': instance.aParam,
      'experian_source': instance.experianSource,
      'mobileNo': instance.mobileNo,
      'creditScoreRequestType': instance.creditScoreRequestType,
    };
