// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheme_investment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemesInvestmentRequestModel _$SchemesInvestmentRequestModelFromJson(
        Map<String, dynamic> json) =>
    SchemesInvestmentRequestModel(
      phone: json['phone'] as String?,
      vendor_id: json['vendor_id'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$SchemesInvestmentRequestModelToJson(
        SchemesInvestmentRequestModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'vendor_id': instance.vendor_id,
      'source': instance.source,
    };

SchemesInvestmentResponseModel _$SchemesInvestmentResponseModelFromJson(
        Map<String, dynamic> json) =>
    SchemesInvestmentResponseModel(
      status: json['status'],
      schemesList: (json['schemes'] as List<dynamic>?)
          ?.map((e) => Schemes.fromJson(e as Map<String, dynamic>))
          .toList(),
      kyc_status: json['kyc_status'] == null
          ? null
          : KycStatus.fromJson(json['kyc_status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SchemesInvestmentResponseModelToJson(
        SchemesInvestmentResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'schemes': instance.schemesList,
      'kyc_status': instance.kyc_status,
    };

KycStatus _$KycStatusFromJson(Map<String, dynamic> json) => KycStatus(
      lender_id: json['lender_id'] as String?,
      step: json['step'],
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$KycStatusToJson(KycStatus instance) => <String, dynamic>{
      'lender_id': instance.lender_id,
      'step': instance.step,
      'msg': instance.msg,
    };

Schemes _$SchemesFromJson(Map<String, dynamic> json) => Schemes(
      scheme_id: json['scheme_id'] as String?,
      partner_id: json['partner_id'] as String?,
      Scheme_Name: json['Scheme_Name'] as String?,
      Min_Inv_Amount: json['Min_Inv_Amount'] as String?,
      Max_Inv_Amount: json['Max_Inv_Amount'] as String?,
      Interest_Rate: json['Interest_Rate'] as String?,
      tenure: json['tenure'] as String?,
      scheme_descripiton: json['scheme_descripiton'] as String?,
    );

Map<String, dynamic> _$SchemesToJson(Schemes instance) => <String, dynamic>{
      'scheme_id': instance.scheme_id,
      'partner_id': instance.partner_id,
      'Scheme_Name': instance.Scheme_Name,
      'Min_Inv_Amount': instance.Min_Inv_Amount,
      'Max_Inv_Amount': instance.Max_Inv_Amount,
      'Interest_Rate': instance.Interest_Rate,
      'tenure': instance.tenure,
      'scheme_descripiton': instance.scheme_descripiton,
    };
