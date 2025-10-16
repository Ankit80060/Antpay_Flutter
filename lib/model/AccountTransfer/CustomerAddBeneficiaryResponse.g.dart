// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CustomerAddBeneficiaryResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerAddBeneficiaryResponse _$CustomerAddBeneficiaryResponseFromJson(
        Map<String, dynamic> json) =>
    CustomerAddBeneficiaryResponse(
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

Map<String, dynamic> _$CustomerAddBeneficiaryResponseToJson(
        CustomerAddBeneficiaryResponse instance) =>
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

CustomerAddBeneficiaryRequest _$CustomerAddBeneficiaryRequestFromJson(
        Map<String, dynamic> json) =>
    CustomerAddBeneficiaryRequest(
      aParam: json['aParam'] as String?,
      messageCode: json['messageCode'] as String?,
      customerId: json['customerId'] as String?,
      customerMobile: json['customerMobile'] as String?,
      beneficiaryMobile: json['beneficiaryMobileNumber'] as String?,
      bankName: json['bankName'] as String?,
      beneficiaryName: json['beneficiaryName'] as String?,
      groupName: json['group_name'] as String?,
      bankAccountNumber: json['bankAccountNumber'] as String?,
      ifscCode: json['ifscCode'] as String?,
      clientTxnId: json['clientTxnId'] as String?,
      requestDateTime: json['requestDateTime'] as String?,
      beneficiaryTypeCode: (json['beneficiaryTypeCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CustomerAddBeneficiaryRequestToJson(
        CustomerAddBeneficiaryRequest instance) =>
    <String, dynamic>{
      'messageCode': instance.messageCode,
      'customerId': instance.customerId,
      'customerMobile': instance.customerMobile,
      'beneficiaryMobileNumber': instance.beneficiaryMobile,
      'bankName': instance.bankName,
      'beneficiaryName': instance.beneficiaryName,
      'group_name': instance.groupName,
      'bankAccountNumber': instance.bankAccountNumber,
      'ifscCode': instance.ifscCode,
      'clientTxnId': instance.clientTxnId,
      'requestDateTime': instance.requestDateTime,
      'beneficiaryTypeCode': instance.beneficiaryTypeCode,
      'aParam': instance.aParam,
    };
