// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generatePayUOrderModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratePayUOrderModel _$GeneratePayUOrderModelFromJson(
        Map<String, dynamic> json) =>
    GeneratePayUOrderModel(
      amount: json['amount'] as String?,
      mobile: json['mobile'] as String?,
      service: json['service'] as String?,
      channel: json['channel'] as String?,
      source: json['source'],
    );

Map<String, dynamic> _$GeneratePayUOrderModelToJson(
        GeneratePayUOrderModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'mobile': instance.mobile,
      'service': instance.service,
      'channel': instance.channel,
      'source': instance.source,
    };

GeneratePayUOrderModelBean _$GeneratePayUOrderModelBeanFromJson(
        Map<String, dynamic> json) =>
    GeneratePayUOrderModelBean(
      status: const StringOrIntToIntConverter().fromJson(json['status']),
      antTxnId: json['ant_txn_id'] as String?,
      fee: json['fee'],
      amount: json['amount'],
      finalAmount: json['final_amount'],
      orderId: json['order_id'] as String?,
      apiKey: json['api_key'] as String?,
      salt: json['payu_salt'] as String?,
      pgType: json['pg_type'] as String?,
      channel: json['channel'] as String?,
      msg: json['msg'] as String?,
      pKyc: json['p_kyc'] as String?,
      errorMsg: json['error_msg'] as String?,
    );

Map<String, dynamic> _$GeneratePayUOrderModelBeanToJson(
        GeneratePayUOrderModelBean instance) =>
    <String, dynamic>{
      'status': const StringOrIntToIntConverter().toJson(instance.status),
      'ant_txn_id': instance.antTxnId,
      'fee': instance.fee,
      'amount': instance.amount,
      'final_amount': instance.finalAmount,
      'order_id': instance.orderId,
      'api_key': instance.apiKey,
      'payu_salt': instance.salt,
      'pg_type': instance.pgType,
      'channel': instance.channel,
      'msg': instance.msg,
      'p_kyc': instance.pKyc,
      'error_msg': instance.errorMsg,
    };
