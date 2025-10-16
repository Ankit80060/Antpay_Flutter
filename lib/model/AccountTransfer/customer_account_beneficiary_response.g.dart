// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_account_beneficiary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerAccountBeneficiaryResponse _$CustomerAccountBeneficiaryResponseFromJson(
        Map<String, dynamic> json) =>
    CustomerAccountBeneficiaryResponse(
      customerId: json['customerId'] as String?,
      responseCode: json['responseCode'] as String?,
      messageCode: (json['messageCode'] as num?)?.toInt(),
      clientTxnId: json['clientTxnId'] as String?,
      responseDateTime: json['responseDateTime'] as String?,
      responseMessage: json['responseMessage'] as String?,
      accosaRefNo: json['accosaRefNo'] as String?,
      token: json['token'] as String?,
      beneficiaryID: json['beneficiaryID'] as String?,
      accountNumber: json['accountNumber'] as String?,
      beneficiaryName: json['beneficiaryName'] as String?,
      transactionAmount: (json['transactionAmount'] as num?)?.toInt(),
      transactionId: json['transactionId'] as String?,
      metaDataStatus: json['metaDataStatus'] as String?,
      resourceDataStatus: json['resourceDataStatus'] as String?,
      transactionReferenceNo: json['transactionReferenceNo'] as String?,
      status: (json['status'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$CustomerAccountBeneficiaryResponseToJson(
        CustomerAccountBeneficiaryResponse instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'responseCode': instance.responseCode,
      'messageCode': instance.messageCode,
      'clientTxnId': instance.clientTxnId,
      'responseDateTime': instance.responseDateTime,
      'responseMessage': instance.responseMessage,
      'accosaRefNo': instance.accosaRefNo,
      'token': instance.token,
      'beneficiaryID': instance.beneficiaryID,
      'accountNumber': instance.accountNumber,
      'beneficiaryName': instance.beneficiaryName,
      'transactionAmount': instance.transactionAmount,
      'transactionId': instance.transactionId,
      'metaDataStatus': instance.metaDataStatus,
      'resourceDataStatus': instance.resourceDataStatus,
      'transactionReferenceNo': instance.transactionReferenceNo,
      'status': instance.status,
      'msg': instance.msg,
      'reason': instance.reason,
    };
