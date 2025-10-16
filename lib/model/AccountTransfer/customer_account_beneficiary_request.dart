import 'package:json_annotation/json_annotation.dart';

part 'customer_account_beneficiary_request.g.dart';

@JsonSerializable()
class CustomerAccountBeneficiaryRequest {
  @JsonKey(name: 'mobile')
  final String customerMobile;

  @JsonKey(name: 'aParam')
  String? aParam;

  @JsonKey(name: 'beneficiaryMobileNumber')
  final String beneficiaryMobile;

  @JsonKey(name: 'customerId')
  dynamic customerId;

  @JsonKey(name: 'creditAccountNumber')
  final String? bankAccountNumber;

  @JsonKey(name: 'beneficiaryIFSC')
  final String? beneficiaryIFSC;

  @JsonKey(name: 'paymentDescription')
  final String? paymentDescription;

  @JsonKey(name: 'transferType')
  final int? transferType;

  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'receiverInfo')
  final String beneficiaryName;

  @JsonKey(name: 'deviceId')
  final String? deviceId;

  @JsonKey(name: 'requestIp')
  final String? requestIp;

  @JsonKey(name: 'group_name')
  final String? groupName;

  @JsonKey(name: 'amount')
  final String? amount;

  @JsonKey(name: 'mpin')
  final String? mpin;

  @JsonKey(name: 'token')
  final String? token;

  @JsonKey(name: 'otp')
  final String? otp;

  CustomerAccountBeneficiaryRequest( {
    this.otp,
    required this.customerMobile,
    required this.beneficiaryMobile,
    required this.customerId,
     this.bankAccountNumber,
     this.beneficiaryIFSC,
     this.paymentDescription,
     this.transferType,
     this.currency,
    required this.beneficiaryName,
     this.deviceId,
     this.requestIp,
     this.groupName,
     this.amount,
     this.mpin,
     this.token,
    this.aParam
  });

  factory CustomerAccountBeneficiaryRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerAccountBeneficiaryRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CustomerAccountBeneficiaryRequestToJson(this);
}
