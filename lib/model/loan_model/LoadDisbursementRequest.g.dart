// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoadDisbursementRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadDisbursementRequest _$LoadDisbursementRequestFromJson(
        Map<String, dynamic> json) =>
    LoadDisbursementRequest(
      borrowerId: json['borrower_id'] as String?,
      loanId: json['loan_id'] as String?,
      service: json['service'] as String?,
      channel: json['channel'] as String?,
      mobile: json['mobile'] as String?,
      amount: json['amount'] as String?,
    );

Map<String, dynamic> _$LoadDisbursementRequestToJson(
        LoadDisbursementRequest instance) =>
    <String, dynamic>{
      'borrower_id': instance.borrowerId,
      'loan_id': instance.loanId,
      'service': instance.service,
      'channel': instance.channel,
      'mobile': instance.mobile,
      'amount': instance.amount,
    };
