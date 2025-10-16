// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CustomerFundTransferResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerFundTransferResponse _$CustomerFundTransferResponseFromJson(
        Map<String, dynamic> json) =>
    CustomerFundTransferResponse(
      responseCode: json['responseCode'] as String?,
      messageCode: (json['messageCode'] as num?)?.toInt(),
      clientTxnId: json['clientTxnId'] as String?,
      clientId: json['clientId'] as String?,
      responseDateTime: json['responseDateTime'] as String?,
      accosaTransactionId: (json['accosaTransactionId'] as num?)?.toInt(),
      responseMessage: json['responseMessage'] as String?,
      bankId: (json['bankId'] as num?)?.toInt(),
      transactionAmount: (json['transactionAmount'] as num?)?.toInt(),
      senders: (json['senders'] as List<dynamic>?)
          ?.map((e) => Sender.fromJson(e as Map<String, dynamic>))
          .toList(),
      receivers: (json['receivers'] as List<dynamic>?)
          ?.map((e) => Receiver.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerFundTransferResponseToJson(
        CustomerFundTransferResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'messageCode': instance.messageCode,
      'clientTxnId': instance.clientTxnId,
      'clientId': instance.clientId,
      'responseDateTime': instance.responseDateTime,
      'accosaTransactionId': instance.accosaTransactionId,
      'responseMessage': instance.responseMessage,
      'bankId': instance.bankId,
      'transactionAmount': instance.transactionAmount,
      'senders': instance.senders,
      'receivers': instance.receivers,
    };

Receiver _$ReceiverFromJson(Map<String, dynamic> json) => Receiver(
      urn: (json['urn'] as num?)?.toInt(),
      customerId: json['customerId'] as String?,
      accosaRefNo: (json['accosaRefNo'] as num?)?.toInt(),
      availableBalance: (json['availableBalance'] as num?)?.toInt(),
      transactionAmount: (json['transactionAmount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReceiverToJson(Receiver instance) => <String, dynamic>{
      'urn': instance.urn,
      'customerId': instance.customerId,
      'accosaRefNo': instance.accosaRefNo,
      'availableBalance': instance.availableBalance,
      'transactionAmount': instance.transactionAmount,
    };

Sender _$SenderFromJson(Map<String, dynamic> json) => Sender(
      urn: (json['urn'] as num?)?.toInt(),
      customerId: json['customerId'] as String?,
      accosaRefNo: (json['accosaRefNo'] as num?)?.toInt(),
      availableBalance: (json['availableBalance'] as num?)?.toInt(),
      transactionAmount: (json['transactionAmount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SenderToJson(Sender instance) => <String, dynamic>{
      'urn': instance.urn,
      'customerId': instance.customerId,
      'accosaRefNo': instance.accosaRefNo,
      'availableBalance': instance.availableBalance,
      'transactionAmount': instance.transactionAmount,
    };
