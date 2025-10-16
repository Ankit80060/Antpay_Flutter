// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bank_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBankAccountRequestModel _$UserBankAccountRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserBankAccountRequestModel(
      lender_id: json['lender_id'] as String?,
      phone: json['phone'] as String?,
      fullname: json['fullname'] as String?,
      account_number: json['account_no'] as String?,
      confirm_acc_number: json['caccount_no'] as String?,
      ifscCode: json['ifsc_code'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$UserBankAccountRequestModelToJson(
        UserBankAccountRequestModel instance) =>
    <String, dynamic>{
      'lender_id': instance.lender_id,
      'phone': instance.phone,
      'fullname': instance.fullname,
      'account_no': instance.account_number,
      'caccount_no': instance.confirm_acc_number,
      'ifsc_code': instance.ifscCode,
      'source': instance.source,
    };

UserBankAccountResponseModel _$UserBankAccountResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserBankAccountResponseModel(
      status: json['status'],
      lender_id: json['lender_id'] as String?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$UserBankAccountResponseModelToJson(
        UserBankAccountResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'lender_id': instance.lender_id,
      'msg': instance.msg,
    };
