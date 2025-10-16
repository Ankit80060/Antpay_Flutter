// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_wallet_beneficiary_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletAddBenefiaryResponseModel _$WalletAddBenefiaryResponseModelFromJson(
        Map<String, dynamic> json) =>
    WalletAddBenefiaryResponseModel(
      urn: (json['urn'] as num?)?.toInt(),
      customerId: json['customerId'] as String?,
      responseCode: json['responseCode'] as String?,
      messageCode: (json['messageCode'] as num?)?.toInt(),
      clientTxnId: json['clientTxnId'] as String?,
      clientId: json['clientId'] as String?,
      responseDateTime: json['responseDateTime'] as String?,
      accosaTransactionId: (json['accosaTransactionId'] as num?)?.toInt(),
      responseMessage: json['responseMessage'] as String?,
      bankId: (json['bankId'] as num?)?.toInt(),
      beneficiaryId: (json['beneficiaryId'] as num?)?.toInt(),
      beneficiaryTypeCode: (json['beneficiaryTypeCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WalletAddBenefiaryResponseModelToJson(
        WalletAddBenefiaryResponseModel instance) =>
    <String, dynamic>{
      'urn': instance.urn,
      'customerId': instance.customerId,
      'responseCode': instance.responseCode,
      'messageCode': instance.messageCode,
      'clientTxnId': instance.clientTxnId,
      'clientId': instance.clientId,
      'responseDateTime': instance.responseDateTime,
      'accosaTransactionId': instance.accosaTransactionId,
      'responseMessage': instance.responseMessage,
      'bankId': instance.bankId,
      'beneficiaryId': instance.beneficiaryId,
      'beneficiaryTypeCode': instance.beneficiaryTypeCode,
    };
