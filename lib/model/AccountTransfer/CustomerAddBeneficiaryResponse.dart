

import 'package:json_annotation/json_annotation.dart';

part 'CustomerAddBeneficiaryResponse.g.dart';

@JsonSerializable()
class CustomerAddBeneficiaryResponse{

  @JsonKey(name: 'urn')
  final int? urn;

  @JsonKey(name: 'customerId')
  final String? customerId;

  @JsonKey(name: 'responseCode')
  final String? responseCode;

  @JsonKey(name: 'messageCode')
  final int? messageCode;

  @JsonKey(name: 'clientTxnId')
  final String? clientTxnId;

  @JsonKey(name: 'clientId')
  final String? clientId;

  @JsonKey(name: 'responseDateTime')
  final String? responseDateTime;

  @JsonKey(name: 'accosaTransactionId')
  final int? accosaTransactionId;

  @JsonKey(name: 'responseMessage')
  final String? responseMessage;

  @JsonKey(name: 'bankId')
  final int? bankId;

  @JsonKey(name: 'beneficiaryId')
  final int? beneficiaryId;

  @JsonKey(name: 'beneficiaryTypeCode')
  final int? beneficiaryTypeCode;

  CustomerAddBeneficiaryResponse({
    this.urn,
    this.customerId,
    this.responseCode,
    this.messageCode,
    this.clientTxnId,
    this.clientId,
    this.responseDateTime,
    this.accosaTransactionId,
    this.responseMessage,
    this.bankId,
    this.beneficiaryId,
    this.beneficiaryTypeCode,
  });

  factory CustomerAddBeneficiaryResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerAddBeneficiaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerAddBeneficiaryResponseToJson(this);
}


@JsonSerializable()
class CustomerAddBeneficiaryRequest {
  @JsonKey(name: 'messageCode')
  final String? messageCode;

  @JsonKey(name: 'customerId')
  final String? customerId;

  @JsonKey(name: 'customerMobile')
  final String? customerMobile;

  @JsonKey(name: 'beneficiaryMobileNumber')
  final String? beneficiaryMobile;

  @JsonKey(name: 'bankName')
  final String? bankName;

  @JsonKey(name: 'beneficiaryName')
  final String? beneficiaryName;

  @JsonKey(name: 'group_name')
  final String? groupName;

  @JsonKey(name: 'bankAccountNumber')
  final String? bankAccountNumber;

  @JsonKey(name: 'ifscCode')
  final String? ifscCode;

  @JsonKey(name: 'clientTxnId')
  final String? clientTxnId;

  @JsonKey(name: 'requestDateTime')
  final String? requestDateTime;

  @JsonKey(name: 'beneficiaryTypeCode')
  final int? beneficiaryTypeCode;
 @JsonKey(name: 'aParam')
  final String? aParam;

  CustomerAddBeneficiaryRequest({
    this.aParam,
    this.messageCode,
    this.customerId,
    this.customerMobile,
    this.beneficiaryMobile,
    this.bankName,
    this.beneficiaryName,
    this.groupName,
    this.bankAccountNumber,
    this.ifscCode,
    this.clientTxnId,
    this.requestDateTime,
    this.beneficiaryTypeCode,
  });

  factory CustomerAddBeneficiaryRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerAddBeneficiaryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerAddBeneficiaryRequestToJson(this);
}