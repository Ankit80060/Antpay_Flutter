// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_wallet_beneficiary_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletAddBenficiaryRequestModel _$WalletAddBenficiaryRequestModelFromJson(
        Map<String, dynamic> json) =>
    WalletAddBenficiaryRequestModel(
      beneficiaryMobileNumber: json['beneficiaryMobileNumber'] as String?,
      beneficiaryName: json['beneficiaryName'] as String?,
      beneficiaryTypeCode: (json['beneficiaryTypeCode'] as num?)?.toInt(),
      clientTxnId: json['clientTxnId'] as String?,
      customerId: json['customerId'] as String?,
      customerMobile: json['customerMobile'] as String?,
      groupName: json['group_name'] as String?,
      messageCode: json['messageCode'] as String?,
      requestDateTime: json['requestDateTime'] as String?,
      aParam: json['aParam'] as String?,
    );

Map<String, dynamic> _$WalletAddBenficiaryRequestModelToJson(
        WalletAddBenficiaryRequestModel instance) =>
    <String, dynamic>{
      'beneficiaryMobileNumber': instance.beneficiaryMobileNumber,
      'beneficiaryName': instance.beneficiaryName,
      'beneficiaryTypeCode': instance.beneficiaryTypeCode,
      'clientTxnId': instance.clientTxnId,
      'customerId': instance.customerId,
      'customerMobile': instance.customerMobile,
      'group_name': instance.groupName,
      'messageCode': instance.messageCode,
      'requestDateTime': instance.requestDateTime,
      'aParam': instance.aParam,
    };
