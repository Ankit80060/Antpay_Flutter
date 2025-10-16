// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CustomerFundTransferRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerFundTransferRequest _$CustomerFundTransferRequestFromJson(
        Map<String, dynamic> json) =>
    CustomerFundTransferRequest(
      aParam: json['aParam'] as String?,
      messageCode: json['messageCode'] as String?,
      clientTxnId: json['clientTxnId'] as String?,
      requestDateTime: json['requestDateTime'] as String?,
      mobile: json['mobile'] as String?,
      tagName: json['tag_name'] as String?,
      remark: json['remark'] as String?,
      beneficiaryId: json['beneficiary_id'] as String?,
      feeRate: json['fee_rate'] as String?,
      mpin: json['mpin'] as String?,
      token: json['token'] as String?,
      otp: json['otp'] as String?,
      deviceId: json['deviceId'] as String?,
      requestIp: json['requestIp'] as String?,
      beneficiaryMobile: json['beneficiaryMobile'] as String?,
      senders: (json['senders'] as List<dynamic>?)
          ?.map((e) => RequestSender.fromJson(e as Map<String, dynamic>))
          .toList(),
      receivers: (json['receivers'] as List<dynamic>?)
          ?.map((e) => RequestReceiver.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerFundTransferRequestToJson(
        CustomerFundTransferRequest instance) =>
    <String, dynamic>{
      'aParam': instance.aParam,
      'messageCode': instance.messageCode,
      'clientTxnId': instance.clientTxnId,
      'requestDateTime': instance.requestDateTime,
      'mobile': instance.mobile,
      'tag_name': instance.tagName,
      'remark': instance.remark,
      'beneficiary_id': instance.beneficiaryId,
      'fee_rate': instance.feeRate,
      'mpin': instance.mpin,
      'token': instance.token,
      'otp': instance.otp,
      'deviceId': instance.deviceId,
      'requestIp': instance.requestIp,
      'beneficiaryMobile': instance.beneficiaryMobile,
      'senders': instance.senders,
      'receivers': instance.receivers,
    };

RequestSender _$RequestSenderFromJson(Map<String, dynamic> json) =>
    RequestSender(
      customerId: json['customerId'] as String?,
      urn: json['urn'] as String?,
      transactionAmount: json['transactionAmount'] as String?,
      sourceAccountType: json['sourceAccountType'] as String?,
      accountNumber: json['accountNumber'] as String?,
      reserved1: json['reserved1'] as String?,
      reserved2: json['reserved2'] as String?,
      reserved3: json['reserved3'] as String?,
    );

Map<String, dynamic> _$RequestSenderToJson(RequestSender instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'urn': instance.urn,
      'transactionAmount': instance.transactionAmount,
      'sourceAccountType': instance.sourceAccountType,
      'accountNumber': instance.accountNumber,
      'reserved1': instance.reserved1,
      'reserved2': instance.reserved2,
      'reserved3': instance.reserved3,
    };

RequestReceiver _$RequestReceiverFromJson(Map<String, dynamic> json) =>
    RequestReceiver(
      customerId: json['customerId'] as String?,
      urn: json['urn'] as String?,
      transactionAmount: json['transactionAmount'] as String?,
      accountNumber: json['accountNumber'] as String?,
      reserved4: json['reserved4'] as String?,
      reserved5: json['reserved5'] as String?,
      reserved6: json['reserved6'] as String?,
    );

Map<String, dynamic> _$RequestReceiverToJson(RequestReceiver instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'urn': instance.urn,
      'transactionAmount': instance.transactionAmount,
      'accountNumber': instance.accountNumber,
      'reserved4': instance.reserved4,
      'reserved5': instance.reserved5,
      'reserved6': instance.reserved6,
    };
