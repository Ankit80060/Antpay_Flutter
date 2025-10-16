// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProcessPaymentRequestModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcessPaymentRequestModel _$ProcessPaymentRequestModelFromJson(
        Map<String, dynamic> json) =>
    ProcessPaymentRequestModel(
      amount: json['amount'] as String,
      antTrxId: json['antTrxId'] as String,
      p3: json['p3'] as String,
      p5: json['p5'] as String,
      paymentMethod: json['paymentMethod'] as String,
      payuResponse: json['payuResponse'] as String,
      transactionResult: (json['transactionResult'] as num).toInt(),
      transactionType: json['transactionType'] as String,
    );

Map<String, dynamic> _$ProcessPaymentRequestModelToJson(
        ProcessPaymentRequestModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'antTrxId': instance.antTrxId,
      'p3': instance.p3,
      'p5': instance.p5,
      'paymentMethod': instance.paymentMethod,
      'payuResponse': instance.payuResponse,
      'transactionResult': instance.transactionResult,
      'transactionType': instance.transactionType,
    };
