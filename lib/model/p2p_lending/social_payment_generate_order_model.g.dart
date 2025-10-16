// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_payment_generate_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialPaymentGenerateOrderRequestModel
    _$SocialPaymentGenerateOrderRequestModelFromJson(
            Map<String, dynamic> json) =>
        SocialPaymentGenerateOrderRequestModel(
          amount: json['amount'] as String?,
          channel: json['channel'] as String?,
          mobile: json['mobile'] as String?,
          service: json['service'] as String?,
          source: json['source'] as String?,
        );

Map<String, dynamic> _$SocialPaymentGenerateOrderRequestModelToJson(
        SocialPaymentGenerateOrderRequestModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'channel': instance.channel,
      'mobile': instance.mobile,
      'service': instance.service,
      'source': instance.source,
    };

SocialPaymentGenerateOrderResponseModel
    _$SocialPaymentGenerateOrderResponseModelFromJson(
            Map<String, dynamic> json) =>
        SocialPaymentGenerateOrderResponseModel(
          status: json['status'],
          ant_txn_id: json['ant_txn_id'] as String?,
          fee: (json['fee'] as num?)?.toInt(),
          amount: (json['amount'] as num?)?.toInt(),
          final_amount: (json['final_amount'] as num?)?.toInt(),
          order_id: json['order_id'] as String?,
          api_key: json['api_key'] as String?,
          pg_type: json['pg_type'] as String?,
          channel: json['channel'] as String?,
          msg: json['msg'] as String?,
        );

Map<String, dynamic> _$SocialPaymentGenerateOrderResponseModelToJson(
        SocialPaymentGenerateOrderResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'ant_txn_id': instance.ant_txn_id,
      'fee': instance.fee,
      'amount': instance.amount,
      'final_amount': instance.final_amount,
      'order_id': instance.order_id,
      'api_key': instance.api_key,
      'pg_type': instance.pg_type,
      'channel': instance.channel,
      'msg': instance.msg,
    };
