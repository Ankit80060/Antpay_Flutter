// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lender_investment_model_.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LenderInvestmentRequestModel _$LenderInvestmentRequestModelFromJson(
        Map<String, dynamic> json) =>
    LenderInvestmentRequestModel(
      lender_id: json['lender_id'] as String?,
      phone: json['phone'] as String?,
      amount: json['amount'] as String?,
      scheme_id: json['scheme_id'] as String?,
      ant_txn_id: json['ant_txn_id'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$LenderInvestmentRequestModelToJson(
        LenderInvestmentRequestModel instance) =>
    <String, dynamic>{
      'lender_id': instance.lender_id,
      'phone': instance.phone,
      'amount': instance.amount,
      'scheme_id': instance.scheme_id,
      'ant_txn_id': instance.ant_txn_id,
      'source': instance.source,
    };

LenderInvestmentResponseModel _$LenderInvestmentResponseModelFromJson(
        Map<String, dynamic> json) =>
    LenderInvestmentResponseModel(
      status: json['status'],
      investment_no: json['investment_no'] as String?,
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$LenderInvestmentResponseModelToJson(
        LenderInvestmentResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'investment_no': instance.investment_no,
      'msg': instance.msg,
    };
