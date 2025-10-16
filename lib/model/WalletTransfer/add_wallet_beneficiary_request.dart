import 'package:json_annotation/json_annotation.dart';

part 'add_wallet_beneficiary_request.g.dart';

@JsonSerializable()
class WalletAddBenficiaryRequestModel {
  @JsonKey(name: "beneficiaryMobileNumber")
  String? beneficiaryMobileNumber;

  @JsonKey(name: "beneficiaryName")
  String? beneficiaryName;

  @JsonKey(name: "beneficiaryTypeCode")
  int? beneficiaryTypeCode;

  @JsonKey(name: "clientTxnId")
  String? clientTxnId;

  @JsonKey(name: "customerId")
  String? customerId;

  @JsonKey(name: "customerMobile")
  String? customerMobile;

  @JsonKey(name: "group_name")
  String? groupName;

  @JsonKey(name: "messageCode")
  String? messageCode;

  @JsonKey(name: "requestDateTime")
  String? requestDateTime;

  @JsonKey(name: "aParam")
  String? aParam;

  WalletAddBenficiaryRequestModel({
    this.beneficiaryMobileNumber,
    this.beneficiaryName,
    this.beneficiaryTypeCode,
    this.clientTxnId,
    this.customerId,
    this.customerMobile,
    this.groupName,
    this.messageCode,
    this.requestDateTime,
    this.aParam,
  });

  factory WalletAddBenficiaryRequestModel.fromJson(Map<String, dynamic> json) =>
      _$WalletAddBenficiaryRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WalletAddBenficiaryRequestModelToJson(this);
}
