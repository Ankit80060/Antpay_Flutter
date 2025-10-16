// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BillersLifeInsurance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillersRequestModel _$BillersRequestModelFromJson(Map<String, dynamic> json) =>
    BillersRequestModel(
      billerId: json['billerId'] as String,
      aParam: json['aParam'] as String,
    );

Map<String, dynamic> _$BillersRequestModelToJson(
        BillersRequestModel instance) =>
    <String, dynamic>{
      'billerId': instance.billerId,
      'aParam': instance.aParam,
    };

BillersLifeInsurance _$BillersLifeInsuranceFromJson(
        Map<String, dynamic> json) =>
    BillersLifeInsurance(
      inputfield: (json['billers'] as List<dynamic>?)
          ?.map((e) => BillerInputFields.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'],
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$BillersLifeInsuranceToJson(
        BillersLifeInsurance instance) =>
    <String, dynamic>{
      'billers': instance.inputfield,
      'status': instance.status,
      'msg': instance.msg,
    };

BillerInputFields _$BillerInputFieldsFromJson(Map<String, dynamic> json) =>
    BillerInputFields(
      id: json['id'] as String?,
      billerId: json['billerId'] as String?,
      paramName: json['paramName'] as String?,
      dataType: json['dataType'] as String?,
      isOptional: json['isOptional'] as String?,
      minLength: json['minLength'] as String?,
      maxLength: json['maxLength'] as String?,
      regEx: json['regEx'] as String?,
      billerPaymentExactness: json['billerPaymentExactness'] as String?,
      biller_full_response: json['biller_full_response'] as String?,
    );

Map<String, dynamic> _$BillerInputFieldsToJson(BillerInputFields instance) =>
    <String, dynamic>{
      'id': instance.id,
      'billerId': instance.billerId,
      'paramName': instance.paramName,
      'dataType': instance.dataType,
      'isOptional': instance.isOptional,
      'minLength': instance.minLength,
      'maxLength': instance.maxLength,
      'regEx': instance.regEx,
      'billerPaymentExactness': instance.billerPaymentExactness,
      'biller_full_response': instance.biller_full_response,
    };

billersRequestModelNew _$billersRequestModelNewFromJson(
        Map<String, dynamic> json) =>
    billersRequestModelNew(
      billerCategory: json['billerId'] as String?,
    );

Map<String, dynamic> _$billersRequestModelNewToJson(
        billersRequestModelNew instance) =>
    <String, dynamic>{
      'billerId': instance.billerCategory,
    };
