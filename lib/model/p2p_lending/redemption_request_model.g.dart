// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redemption_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedemptionRequestModel _$RedemptionRequestModelFromJson(
        Map<String, dynamic> json) =>
    RedemptionRequestModel(
      phone: json['phone'] as String?,
      investment_no: json['investment_no'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$RedemptionRequestModelToJson(
        RedemptionRequestModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'investment_no': instance.investment_no,
      'source': instance.source,
    };

RedemptionResponseModel _$RedemptionResponseModelFromJson(
        Map<String, dynamic> json) =>
    RedemptionResponseModel(
      status: json['status'],
      redemption_request: json['redemption_request'] == null
          ? null
          : RedemptionResponse.fromJson(
              json['redemption_request'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RedemptionResponseModelToJson(
        RedemptionResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'redemption_request': instance.redemption_request,
    };

RedemptionResponse _$RedemptionResponseFromJson(Map<String, dynamic> json) =>
    RedemptionResponse(
      investmentNo: json['investment_No'] as String?,
      schemeName: json['scheme_Name'] as String?,
      investmentDate: json['investment_date'] as String?,
      redemptionDate: json['redemption_date'] as String?,
      redemptionStatus: json['redemption_status'] as String?,
      amount: json['amount'] as String?,
      finalAmount: json['final_amount'] as String?,
      interestRate: json['interest_rate'] as String?,
      noOfDays: json['no_of_days'],
      interestAmount: json['interest_amount'] as String?,
      bankName: json['bank_name'] as String?,
      accountNumber: json['account_number'] as String?,
    );

Map<String, dynamic> _$RedemptionResponseToJson(RedemptionResponse instance) =>
    <String, dynamic>{
      'investment_No': instance.investmentNo,
      'scheme_Name': instance.schemeName,
      'investment_date': instance.investmentDate,
      'redemption_date': instance.redemptionDate,
      'redemption_status': instance.redemptionStatus,
      'amount': instance.amount,
      'final_amount': instance.finalAmount,
      'interest_rate': instance.interestRate,
      'no_of_days': instance.noOfDays,
      'interest_amount': instance.interestAmount,
      'bank_name': instance.bankName,
      'account_number': instance.accountNumber,
    };
