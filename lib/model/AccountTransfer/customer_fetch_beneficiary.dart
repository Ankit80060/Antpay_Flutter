import 'package:json_annotation/json_annotation.dart';

part 'customer_fetch_beneficiary.g.dart';

@JsonSerializable()
class CustomerFetchBeneficiaryResponse {
  @JsonKey(name: 'urn')
  final int? urn;


  @JsonKey(name: 'customerId')
  final String? customerId;

  @JsonKey(name: 'customerMobile')
  final String? customerMobile;

  @JsonKey(name: 'responseCode')
  final String? responseCode;

  @JsonKey(name: 'messageCode')
  dynamic messageCode;

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

  @JsonKey(name: 'beneficiaryDataList')
  List<BeneficiaryData>? beneficiaryDataList;

  CustomerFetchBeneficiaryResponse({
    this.customerMobile,
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
    this.beneficiaryDataList,
  });

  factory CustomerFetchBeneficiaryResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerFetchBeneficiaryResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CustomerFetchBeneficiaryResponseToJson(this);
}

@JsonSerializable()
class BeneficiaryData {
  @JsonKey(name: 'beneficiaryId')
  final int? beneficiaryId;

  @JsonKey(name: 'beneficiaryName')
  final String? beneficiaryName;

  @JsonKey(name: 'bankName')
  final String? bankName;

  @JsonKey(name: 'bankAccountNumber')
  final String? bankAccountNumber;

  @JsonKey(name: 'ifscCode')
  final String? ifscCode;

  @JsonKey(name: 'upiVpa')
  final String? upiVpa;

  @JsonKey(name: 'mobileNumber')
  final String? mobileNumber;

  @JsonKey(name: 'emailId')
  final String? emailId;

  @JsonKey(name: 'walletProgram')
  final String? walletProgram;

  @JsonKey(name: 'status')
  final int? status;

  @JsonKey(name: 'coolingOff')
  final int? coolingOff;

  @JsonKey(name: 'beneficiaryType')
  final int? beneficiaryType;

  @JsonKey(name: 'beneficiaryTypeCode')
  final int? beneficiaryTypeCode;

  @JsonKey(name: 'createdTime')
  final String? createdTime;

  @JsonKey(name: 'modifiedTime')
  final String? modifiedTime;

  @JsonKey(name: 'beneficiaryLimitPerTxn')
  final int? beneficiaryLimitPerTxn;

  @JsonKey(name: 'beneficiaryLimitOutstandingDailyLimit')
  final int? beneficiaryLimitOutstandingDailyLimit;

  @JsonKey(name: 'beneficiaryLimitOutstandingMonthlyLimit')
  final int? beneficiaryLimitOutstandingMonthlyLimit;

  BeneficiaryData({
    this.beneficiaryId,
    this.beneficiaryName,
    this.bankName,
    this.bankAccountNumber,
    this.ifscCode,
    this.upiVpa,
    this.mobileNumber,
    this.emailId,
    this.walletProgram,
    this.status,
    this.coolingOff,
    this.beneficiaryType,
    this.beneficiaryTypeCode,
    this.createdTime,
    this.modifiedTime,
    this.beneficiaryLimitPerTxn,
    this.beneficiaryLimitOutstandingDailyLimit,
    this.beneficiaryLimitOutstandingMonthlyLimit,
  });

  factory BeneficiaryData.fromJson(Map<String, dynamic> json) =>
      _$BeneficiaryDataFromJson(json);

  Map<String, dynamic> toJson() => _$BeneficiaryDataToJson(this);
}


@JsonSerializable()
class CustomerFetchBeneficiaryRequest {


  @JsonKey(name: 'aParam')
  final String? aParam;

  @JsonKey(name: 'messageCode')
  final String? messageCode;

  @JsonKey(name: 'clientTxnId')
  final String? clientTxnId;

  @JsonKey(name: 'requestDateTime')
  final String? requestDateTime;

  @JsonKey(name: 'urn')
  final int? urn;

  @JsonKey(name: 'activationStatus')
  final String? activationStatus;

  @JsonKey(name: 'transferType')
  final String? transferType;

  CustomerFetchBeneficiaryRequest({
    this.aParam,
    this.messageCode,
    this.clientTxnId,
    this.requestDateTime,
    this.urn,
    this.activationStatus,
    this.transferType,
  });

  factory CustomerFetchBeneficiaryRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerFetchBeneficiaryRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CustomerFetchBeneficiaryRequestToJson(this);
}
