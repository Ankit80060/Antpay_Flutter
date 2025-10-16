// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionProfileRequestModel _$TransactionProfileRequestModelFromJson(
        Map<String, dynamic> json) =>
    TransactionProfileRequestModel(
      enablementType: (json['enablementType'] as num).toInt(),
      transactionProfile: (json['transactionProfile'] as List<dynamic>)
          .map((e) => TransactionProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
      urn: json['urn'] as String,
      aParam: json['aParam'] as String,
    );

Map<String, dynamic> _$TransactionProfileRequestModelToJson(
        TransactionProfileRequestModel instance) =>
    <String, dynamic>{
      'enablementType': instance.enablementType,
      'transactionProfile': instance.transactionProfile,
      'urn': instance.urn,
      'aParam': instance.aParam,
    };

TransactionProfile _$TransactionProfileFromJson(Map<String, dynamic> json) =>
    TransactionProfile(
      status: json['status'] as String,
      transactionProfileId: json['transactionProfileId'] as String,
      transactionType: json['transactionType'] as String,
    );

Map<String, dynamic> _$TransactionProfileToJson(TransactionProfile instance) =>
    <String, dynamic>{
      'status': instance.status,
      'transactionProfileId': instance.transactionProfileId,
      'transactionType': instance.transactionType,
    };

TransactionStatusResponseModel _$TransactionStatusResponseModelFromJson(
        Map<String, dynamic> json) =>
    TransactionStatusResponseModel(
      urn: (json['urn'] as num).toInt(),
      description: json['description'] as String,
      responseCode: json['responseCode'] as String,
      messageCode: (json['messageCode'] as num).toInt(),
      clientTxnId: json['clientTxnId'] as String,
      clientId: json['clientId'] as String,
      responseDateTime: json['responseDateTime'] as String,
      accosaTransactionId: (json['accosaTransactionId'] as num).toInt(),
      bankId: (json['bankId'] as num).toInt(),
      transactionProfile: (json['transactionProfile'] as List<dynamic>)
          .map((e) => TransactionProfileRes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransactionStatusResponseModelToJson(
        TransactionStatusResponseModel instance) =>
    <String, dynamic>{
      'urn': instance.urn,
      'description': instance.description,
      'responseCode': instance.responseCode,
      'messageCode': instance.messageCode,
      'clientTxnId': instance.clientTxnId,
      'clientId': instance.clientId,
      'responseDateTime': instance.responseDateTime,
      'accosaTransactionId': instance.accosaTransactionId,
      'bankId': instance.bankId,
      'transactionProfile': instance.transactionProfile,
    };

TransactionProfileRes _$TransactionProfileResFromJson(
        Map<String, dynamic> json) =>
    TransactionProfileRes(
      transactionProfileId: (json['transactionProfileId'] as num).toInt(),
      status: json['status'] as bool,
      updateFlag: json['updateFlag'] as String,
      transactionType: json['transactionType'] as String,
    );

Map<String, dynamic> _$TransactionProfileResToJson(
        TransactionProfileRes instance) =>
    <String, dynamic>{
      'transactionProfileId': instance.transactionProfileId,
      'status': instance.status,
      'updateFlag': instance.updateFlag,
      'transactionType': instance.transactionType,
    };
