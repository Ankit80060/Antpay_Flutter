// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CustomerLoadbalanceResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerLoadbalanceResponse _$CustomerLoadbalanceResponseFromJson(
        Map<String, dynamic> json) =>
    CustomerLoadbalanceResponse(
      urn: (json['urn'] as num?)?.toInt(),
      customerId: json['customerId'] as String?,
      responseCode: json['responseCode'] as String?,
      messageCode: (json['messageCode'] as num?)?.toInt(),
      clientTxnId: json['clientTxnId'] as String?,
      responseDateTime: json['responseDateTime'] as String?,
      accosaTransactionId: (json['accosaTransactionId'] as num?)?.toInt(),
      responseMessage: json['responseMessage'] as String?,
      accosaRefNo: json['accosaRefNo'] as String?,
      availableBalance: (json['availableBalance'] as num?)?.toInt(),
      availableCashLimit: (json['availableCashLimit'] as num?)?.toInt(),
      transactionAmount: (json['transactionAmount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CustomerLoadbalanceResponseToJson(
        CustomerLoadbalanceResponse instance) =>
    <String, dynamic>{
      'urn': instance.urn,
      'customerId': instance.customerId,
      'responseCode': instance.responseCode,
      'messageCode': instance.messageCode,
      'clientTxnId': instance.clientTxnId,
      'responseDateTime': instance.responseDateTime,
      'accosaTransactionId': instance.accosaTransactionId,
      'responseMessage': instance.responseMessage,
      'accosaRefNo': instance.accosaRefNo,
      'availableBalance': instance.availableBalance,
      'availableCashLimit': instance.availableCashLimit,
      'transactionAmount': instance.transactionAmount,
    };
