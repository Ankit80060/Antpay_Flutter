// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_account_beneficiary_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerAccountBeneficiaryRequest _$CustomerAccountBeneficiaryRequestFromJson(
        Map<String, dynamic> json) =>
    CustomerAccountBeneficiaryRequest(
      otp: json['otp'] as String?,
      customerMobile: json['mobile'] as String,
      beneficiaryMobile: json['beneficiaryMobileNumber'] as String,
      customerId: json['customerId'],
      bankAccountNumber: json['creditAccountNumber'] as String?,
      beneficiaryIFSC: json['beneficiaryIFSC'] as String?,
      paymentDescription: json['paymentDescription'] as String?,
      transferType: (json['transferType'] as num?)?.toInt(),
      currency: json['currency'] as String?,
      beneficiaryName: json['receiverInfo'] as String,
      deviceId: json['deviceId'] as String?,
      requestIp: json['requestIp'] as String?,
      groupName: json['group_name'] as String?,
      amount: json['amount'] as String?,
      mpin: json['mpin'] as String?,
      token: json['token'] as String?,
      aParam: json['aParam'] as String?,
    );

Map<String, dynamic> _$CustomerAccountBeneficiaryRequestToJson(
        CustomerAccountBeneficiaryRequest instance) =>
    <String, dynamic>{
      'mobile': instance.customerMobile,
      'aParam': instance.aParam,
      'beneficiaryMobileNumber': instance.beneficiaryMobile,
      'customerId': instance.customerId,
      'creditAccountNumber': instance.bankAccountNumber,
      'beneficiaryIFSC': instance.beneficiaryIFSC,
      'paymentDescription': instance.paymentDescription,
      'transferType': instance.transferType,
      'currency': instance.currency,
      'receiverInfo': instance.beneficiaryName,
      'deviceId': instance.deviceId,
      'requestIp': instance.requestIp,
      'group_name': instance.groupName,
      'amount': instance.amount,
      'mpin': instance.mpin,
      'token': instance.token,
      'otp': instance.otp,
    };
