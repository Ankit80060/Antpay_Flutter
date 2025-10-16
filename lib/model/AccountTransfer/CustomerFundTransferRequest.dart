

import 'package:json_annotation/json_annotation.dart';

part 'CustomerFundTransferRequest.g.dart';

@JsonSerializable()
class CustomerFundTransferRequest {
  @JsonKey(name: 'aParam')
  final String? aParam;
@JsonKey(name: 'messageCode')
  final String? messageCode;

  @JsonKey(name: 'clientTxnId')
  final String? clientTxnId;

  @JsonKey(name: 'requestDateTime')
  final String? requestDateTime;

  @JsonKey(name: 'mobile')
  final String? mobile;

  @JsonKey(name: 'tag_name')
  final String? tagName;

  @JsonKey(name: 'remark')
  final String? remark;

  @JsonKey(name: 'beneficiary_id')
  final String? beneficiaryId;

  @JsonKey(name: 'fee_rate')
  final String? feeRate;

  @JsonKey(name: 'mpin')
  final String? mpin;

  @JsonKey(name: 'token')
  final String? token;

  @JsonKey(name: 'otp')
  final String? otp;

  @JsonKey(name: 'deviceId')
  final String? deviceId;

  @JsonKey(name: 'requestIp')
  final String? requestIp;

  @JsonKey(name: 'beneficiaryMobile')
  final String? beneficiaryMobile;

  @JsonKey(name: 'senders')
  final List<RequestSender>? senders;

  @JsonKey(name: 'receivers')
  final List<RequestReceiver>? receivers;

  CustomerFundTransferRequest( {
    this.aParam,
    this.messageCode,
    this.clientTxnId,
    this.requestDateTime,
    this.mobile,
    this.tagName,
    this.remark,
    this.beneficiaryId,
    this.feeRate,
    this.mpin,
    this.token,
    this.otp,
    this.deviceId,
    this.requestIp,
    this.beneficiaryMobile,
    this.senders,
    this.receivers,
  });

  factory CustomerFundTransferRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerFundTransferRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerFundTransferRequestToJson(this);
}

@JsonSerializable()
class RequestSender {
  @JsonKey(name: 'customerId')
  final String? customerId;

  @JsonKey(name: 'urn')
  final String? urn;

  @JsonKey(name: 'transactionAmount')
  final String? transactionAmount;

  @JsonKey(name: 'sourceAccountType')
  final String? sourceAccountType;

  @JsonKey(name: 'accountNumber') // changed here
  final String? accountNumber;

  @JsonKey(name: 'reserved1')
  final String? reserved1;

  @JsonKey(name: 'reserved2')
  final String? reserved2;

  @JsonKey(name: 'reserved3')
  final String? reserved3;

  RequestSender({
    this.customerId,
    this.urn,
    this.transactionAmount,
    this.sourceAccountType,
    this.accountNumber, // changed here
    this.reserved1,
    this.reserved2,
    this.reserved3,
  });

  factory RequestSender.fromJson(Map<String, dynamic> json) =>
      _$RequestSenderFromJson(json);

  Map<String, dynamic> toJson() => _$RequestSenderToJson(this);
}

@JsonSerializable()
class RequestReceiver {
  @JsonKey(name: 'customerId')
  final String? customerId;

  @JsonKey(name: 'urn')
  final String? urn;

  @JsonKey(name: 'transactionAmount')
  final String? transactionAmount;

  @JsonKey(name: 'accountNumber')
  final String? accountNumber;

  @JsonKey(name: 'reserved4')
  final String? reserved4;

  @JsonKey(name: 'reserved5')
  final String? reserved5;

  @JsonKey(name: 'reserved6')
  final String? reserved6;

  RequestReceiver({
    this.customerId,
    this.urn,
    this.transactionAmount,
    this.accountNumber,
    this.reserved4,
    this.reserved5,
    this.reserved6,
  });

  factory RequestReceiver.fromJson(Map<String, dynamic> json) =>
      _$RequestReceiverFromJson(json);

  Map<String, dynamic> toJson() => _$RequestReceiverToJson(this);
}
