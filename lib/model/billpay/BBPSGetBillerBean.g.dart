// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BBPSGetBillerBean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthInsuranceRequestModel _$HealthInsuranceRequestModelFromJson(
        Map<String, dynamic> json) =>
    HealthInsuranceRequestModel(
      billerCategory: json['billerCategory'] as String?,
      aParam: json['aParam'] as String?,
    );

Map<String, dynamic> _$HealthInsuranceRequestModelToJson(
        HealthInsuranceRequestModel instance) =>
    <String, dynamic>{
      'billerCategory': instance.billerCategory,
      'aParam': instance.aParam,
    };

HealthInsuranceResponseModel _$HealthInsuranceResponseModelFromJson(
        Map<String, dynamic> json) =>
    HealthInsuranceResponseModel(
      status: json['status'],
      msg: json['msg'] as String?,
      billers: (json['biller'] as List<dynamic>?)
          ?.map((e) => Billers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HealthInsuranceResponseModelToJson(
        HealthInsuranceResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'biller': instance.billers,
    };

Billers _$BillersFromJson(Map<String, dynamic> json) => Billers(
      id: json['id'] as String?,
      billerCategory: json['billerCategory'] as String?,
      billerName: json['billerName'] as String?,
      billerId: json['billerId'] as String?,
      billerAdhoc: json['billerAdhoc'] as String?,
      billerCoverage: json['billerCoverage'] as String?,
      billerFetchRequiremet: json['billerFetchRequiremet'] as String?,
      billerPaymentExactness: json['billerPaymentExactness'] as String?,
    );

Map<String, dynamic> _$BillersToJson(Billers instance) => <String, dynamic>{
      'id': instance.id,
      'billerCategory': instance.billerCategory,
      'billerName': instance.billerName,
      'billerId': instance.billerId,
      'billerAdhoc': instance.billerAdhoc,
      'billerCoverage': instance.billerCoverage,
      'billerFetchRequiremet': instance.billerFetchRequiremet,
      'billerPaymentExactness': instance.billerPaymentExactness,
    };
