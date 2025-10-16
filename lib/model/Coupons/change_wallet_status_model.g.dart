// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_wallet_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeWalletStatusResponse _$ChangeWalletStatusResponseFromJson(
        Map<String, dynamic> json) =>
    ChangeWalletStatusResponse(
      responseCode: json['responseCode'] as String,
      responseDateTime: json['responseDateTime'] as String,
      responseMessage: json['responseMessage'] as String,
    );

Map<String, dynamic> _$ChangeWalletStatusResponseToJson(
        ChangeWalletStatusResponse instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseDateTime': instance.responseDateTime,
      'responseMessage': instance.responseMessage,
    };
