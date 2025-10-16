// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCardPaymentResponseModel _$CreditCardPaymentResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreditCardPaymentResponseModel(
      result: json['result'] == null
          ? null
          : ResultModel.fromJson(json['result'] as Map<String, dynamic>),
      exception: json['exception'],
      pagination: json['pagination'],
      txnid: (json['txnid'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreditCardPaymentResponseModelToJson(
        CreditCardPaymentResponseModel instance) =>
    <String, dynamic>{
      'result': instance.result,
      'exception': instance.exception,
      'pagination': instance.pagination,
      'txnid': instance.txnid,
    };

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => ResultModel(
      json['status'] as String?,
    );

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      'status': instance.status,
    };
