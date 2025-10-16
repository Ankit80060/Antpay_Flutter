// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ppi_kyc_reg_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PpiRegisterUserResponse _$PpiRegisterUserResponseFromJson(
        Map<String, dynamic> json) =>
    PpiRegisterUserResponse(
      messageCode: json['messageCode'] as String?,
      clientTxnId: json['clientTxnId'] as String?,
      responseDateTime: json['responseDateTime'] == null
          ? null
          : DateTime.parse(json['responseDateTime'] as String),
      responseCode: json['responseCode'] as String?,
      responseMessage: json['responseMessage'] as String?,
      bankId: json['bankId'] as String?,
      clientId: json['clientId'] as String?,
      customerId: json['customerId'] as String?,
      accosaTransactionId: json['accosaTransactionId'] as String?,
      errMsg: json['err_msg'],
      status: json['status'] as String?,
      formfactor: json['formfactor'] == null
          ? null
          : Formfactor.fromJson(json['formfactor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PpiRegisterUserResponseToJson(
        PpiRegisterUserResponse instance) =>
    <String, dynamic>{
      'messageCode': instance.messageCode,
      'clientTxnId': instance.clientTxnId,
      'responseDateTime': instance.responseDateTime?.toIso8601String(),
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'bankId': instance.bankId,
      'clientId': instance.clientId,
      'customerId': instance.customerId,
      'accosaTransactionId': instance.accosaTransactionId,
      'err_msg': instance.errMsg,
      'status': instance.status,
      'formfactor': instance.formfactor,
    };

Formfactor _$FormfactorFromJson(Map<String, dynamic> json) => Formfactor(
      cardNumber: json['cardNumber'] as String?,
      expiryDate: json['expiryDate'] as String?,
      cvv: json['cvv'] as String?,
    );

Map<String, dynamic> _$FormfactorToJson(Formfactor instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'expiryDate': instance.expiryDate,
      'cvv': instance.cvv,
    };
