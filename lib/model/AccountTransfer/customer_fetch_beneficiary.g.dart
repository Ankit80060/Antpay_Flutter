// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_fetch_beneficiary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerFetchBeneficiaryResponse _$CustomerFetchBeneficiaryResponseFromJson(
        Map<String, dynamic> json) =>
    CustomerFetchBeneficiaryResponse(
      customerMobile: json['customerMobile'] as String?,
      urn: (json['urn'] as num?)?.toInt(),
      customerId: json['customerId'] as String?,
      responseCode: json['responseCode'] as String?,
      messageCode: json['messageCode'],
      clientTxnId: json['clientTxnId'] as String?,
      clientId: json['clientId'] as String?,
      responseDateTime: json['responseDateTime'] as String?,
      accosaTransactionId: (json['accosaTransactionId'] as num?)?.toInt(),
      responseMessage: json['responseMessage'] as String?,
      bankId: (json['bankId'] as num?)?.toInt(),
      beneficiaryDataList: (json['beneficiaryDataList'] as List<dynamic>?)
          ?.map((e) => BeneficiaryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerFetchBeneficiaryResponseToJson(
        CustomerFetchBeneficiaryResponse instance) =>
    <String, dynamic>{
      'urn': instance.urn,
      'customerId': instance.customerId,
      'customerMobile': instance.customerMobile,
      'responseCode': instance.responseCode,
      'messageCode': instance.messageCode,
      'clientTxnId': instance.clientTxnId,
      'clientId': instance.clientId,
      'responseDateTime': instance.responseDateTime,
      'accosaTransactionId': instance.accosaTransactionId,
      'responseMessage': instance.responseMessage,
      'bankId': instance.bankId,
      'beneficiaryDataList': instance.beneficiaryDataList,
    };

BeneficiaryData _$BeneficiaryDataFromJson(Map<String, dynamic> json) =>
    BeneficiaryData(
      beneficiaryId: (json['beneficiaryId'] as num?)?.toInt(),
      beneficiaryName: json['beneficiaryName'] as String?,
      bankName: json['bankName'] as String?,
      bankAccountNumber: json['bankAccountNumber'] as String?,
      ifscCode: json['ifscCode'] as String?,
      upiVpa: json['upiVpa'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      emailId: json['emailId'] as String?,
      walletProgram: json['walletProgram'] as String?,
      status: (json['status'] as num?)?.toInt(),
      coolingOff: (json['coolingOff'] as num?)?.toInt(),
      beneficiaryType: (json['beneficiaryType'] as num?)?.toInt(),
      beneficiaryTypeCode: (json['beneficiaryTypeCode'] as num?)?.toInt(),
      createdTime: json['createdTime'] as String?,
      modifiedTime: json['modifiedTime'] as String?,
      beneficiaryLimitPerTxn: (json['beneficiaryLimitPerTxn'] as num?)?.toInt(),
      beneficiaryLimitOutstandingDailyLimit:
          (json['beneficiaryLimitOutstandingDailyLimit'] as num?)?.toInt(),
      beneficiaryLimitOutstandingMonthlyLimit:
          (json['beneficiaryLimitOutstandingMonthlyLimit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BeneficiaryDataToJson(BeneficiaryData instance) =>
    <String, dynamic>{
      'beneficiaryId': instance.beneficiaryId,
      'beneficiaryName': instance.beneficiaryName,
      'bankName': instance.bankName,
      'bankAccountNumber': instance.bankAccountNumber,
      'ifscCode': instance.ifscCode,
      'upiVpa': instance.upiVpa,
      'mobileNumber': instance.mobileNumber,
      'emailId': instance.emailId,
      'walletProgram': instance.walletProgram,
      'status': instance.status,
      'coolingOff': instance.coolingOff,
      'beneficiaryType': instance.beneficiaryType,
      'beneficiaryTypeCode': instance.beneficiaryTypeCode,
      'createdTime': instance.createdTime,
      'modifiedTime': instance.modifiedTime,
      'beneficiaryLimitPerTxn': instance.beneficiaryLimitPerTxn,
      'beneficiaryLimitOutstandingDailyLimit':
          instance.beneficiaryLimitOutstandingDailyLimit,
      'beneficiaryLimitOutstandingMonthlyLimit':
          instance.beneficiaryLimitOutstandingMonthlyLimit,
    };

CustomerFetchBeneficiaryRequest _$CustomerFetchBeneficiaryRequestFromJson(
        Map<String, dynamic> json) =>
    CustomerFetchBeneficiaryRequest(
      aParam: json['aParam'] as String?,
      messageCode: json['messageCode'] as String?,
      clientTxnId: json['clientTxnId'] as String?,
      requestDateTime: json['requestDateTime'] as String?,
      urn: (json['urn'] as num?)?.toInt(),
      activationStatus: json['activationStatus'] as String?,
      transferType: json['transferType'] as String?,
    );

Map<String, dynamic> _$CustomerFetchBeneficiaryRequestToJson(
        CustomerFetchBeneficiaryRequest instance) =>
    <String, dynamic>{
      'aParam': instance.aParam,
      'messageCode': instance.messageCode,
      'clientTxnId': instance.clientTxnId,
      'requestDateTime': instance.requestDateTime,
      'urn': instance.urn,
      'activationStatus': instance.activationStatus,
      'transferType': instance.transferType,
    };
