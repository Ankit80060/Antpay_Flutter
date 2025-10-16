// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionResponseModel _$TransactionResponseModelFromJson(
        Map<String, dynamic> json) =>
    TransactionResponseModel(
      mobile: json['mobile'] as String?,
      transactionNo: json['transaction_no'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      feeRate: (json['fee_rate'] as num?)?.toDouble(),
      service: json['service'] as String?,
    )
      ..channel = json['channel'] as String?
      ..paymentId = json['payment_id'] as String?
      ..status = json['status'] as String?
      ..createdAt = json['created_at'] as String?;

Map<String, dynamic> _$TransactionResponseModelToJson(
        TransactionResponseModel instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'transaction_no': instance.transactionNo,
      'amount': instance.amount,
      'fee_rate': instance.feeRate,
      'service': instance.service,
      'channel': instance.channel,
      'payment_id': instance.paymentId,
      'status': instance.status,
      'created_at': instance.createdAt,
    };

TransactionRequestModel _$TransactionRequestModelFromJson(
        Map<String, dynamic> json) =>
    TransactionRequestModel(
      mobile: json['mobile'] as String?,
      date: json['date'] as String?,
      transactionNo: json['transaction_no'] as String?,
      sectionName: json['section_name'] as String?,
      aParam: json['aParam'] as String?,
    );

Map<String, dynamic> _$TransactionRequestModelToJson(
        TransactionRequestModel instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'aParam': instance.aParam,
      'date': instance.date,
      'transaction_no': instance.transactionNo,
      'section_name': instance.sectionName,
    };
