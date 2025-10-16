// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RentpayAccountDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentpayAccountDetailsResponce _$RentpayAccountDetailsResponceFromJson(
        Map<String, dynamic> json) =>
    RentpayAccountDetailsResponce(
      status: json['status'],
      beneficiary_id: json['beneficiary_id'],
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$RentpayAccountDetailsResponceToJson(
        RentpayAccountDetailsResponce instance) =>
    <String, dynamic>{
      'status': instance.status,
      'beneficiary_id': instance.beneficiary_id,
      'msg': instance.msg,
    };

RentpayAccountDetailsRequestModel _$RentpayAccountDetailsRequestModelFromJson(
        Map<String, dynamic> json) =>
    RentpayAccountDetailsRequestModel(
      rent_pay_id: json['rent_pay_id'] as String?,
      mobile: json[' mobile'] as String?,
      account_no: json['account_no'] as String?,
      c_account_no: json['c_account_no'] as String?,
      ifsc_code: json['ifsc_code'] as String?,
    );

Map<String, dynamic> _$RentpayAccountDetailsRequestModelToJson(
        RentpayAccountDetailsRequestModel instance) =>
    <String, dynamic>{
      'rent_pay_id': instance.rent_pay_id,
      ' mobile': instance.mobile,
      'account_no': instance.account_no,
      'c_account_no': instance.c_account_no,
      'ifsc_code': instance.ifsc_code,
    };
