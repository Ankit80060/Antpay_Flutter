// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_agreement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanAgreementResponse _$LoanAgreementResponseFromJson(
        Map<String, dynamic> json) =>
    LoanAgreementResponse(
      status: (json['status'] as num?)?.toInt(),
      agreement: json['agreement'] as String?,
    );

Map<String, dynamic> _$LoanAgreementResponseToJson(
        LoanAgreementResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'agreement': instance.agreement,
    };
