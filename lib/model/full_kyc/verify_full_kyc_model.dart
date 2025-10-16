import 'package:json_annotation/json_annotation.dart';
part 'verify_full_kyc_model.g.dart';

@JsonSerializable()
class VerifyFullKycRequest{
  VerifyFullKycRequest({
    this.kycUniqueId,
    this.mobile,
    this.fullName,
    this.email,
    this.pan,
    this.aadhar,
    this.accountNo,
    this.cAccountNo,
    this.bankName,
    this.ifsc,
    this.userType,
    this.source,
    this.product,
    this.otp,
    this.transactionId,
    this.codeVerifier,
    this.fwdp,
    this.validateXml,
  });


  @JsonKey(name:'kyc_unique_id')
  String? kycUniqueId;

  @JsonKey(name:'mobile')
  String? mobile;

  @JsonKey(name:'fullname')
  String? fullName;

  @JsonKey(name:'email')
  String? email;

  @JsonKey(name:'pan')
  String? pan;

  @JsonKey(name:'aadhar')
  String? aadhar;

  @JsonKey(name:'account_no')
  String? accountNo;

  @JsonKey(name:'caccount_no')
  String? cAccountNo;

  @JsonKey(name:'bank_name')
  String? bankName;

  @JsonKey(name:'ifsc_code')
  String? ifsc;

  @JsonKey(name:'user_type')
  String? userType;

  @JsonKey(name:'source')
  String? source;

  @JsonKey(name:'product')
  String? product;

  @JsonKey(name:'otp')
  String? otp;

  @JsonKey(name:'transactionId')
  String? transactionId;

  @JsonKey(name:'codeVerifier')
  String? codeVerifier;

  @JsonKey(name:'fwdp')
  String? fwdp;

  @JsonKey(name:'validateXml')
  bool? validateXml;


  factory VerifyFullKycRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyFullKycRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyFullKycRequestToJson(this);
}


@JsonSerializable()
class VerifyFullKycResponse{
  VerifyFullKycResponse({
    this.status,
    this.response,
  });


  @JsonKey(name:'status')
  dynamic status;

  @JsonKey(name:'response')
  KYCResponse? response;

  factory VerifyFullKycResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyFullKycResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyFullKycResponseToJson(this);
}

@JsonSerializable()
class KYCResponse{
  KYCResponse({
    this.aadharKyc,
    this.panKyc,
    this.bankKyc,
    this.kycUserDetails
  });


  @JsonKey(name:'aadhar_kyc')
  AadharKyc? aadharKyc;

  @JsonKey(name:'pan_kyc')
  PanKyc? panKyc;

  @JsonKey(name:'bank_kyc')
  BankKyc? bankKyc;

  @JsonKey(name:'kyc_user_details')
  KycUserDetails? kycUserDetails;



  @JsonKey(name:'status')
  dynamic status;

  @JsonKey(name:'msg')
  String? msg;

  factory KYCResponse.fromJson(Map<String, dynamic> json) =>
      _$KYCResponseFromJson(json);

  Map<String, dynamic> toJson() => _$KYCResponseToJson(this);
}

@JsonSerializable()
class AadharKyc{
  AadharKyc({
    this.status,
    this.msg,
    this.nameMatch,
    this.dataType,
  });


  @JsonKey(name:'status')
  dynamic status;

  @JsonKey(name:'msg')
  String? msg;

  @JsonKey(name:'name_match')
  dynamic nameMatch;

  @JsonKey(name:'dataType')
  String? dataType;


  factory AadharKyc.fromJson(Map<String, dynamic> json) =>
      _$AadharKycFromJson(json);

  Map<String, dynamic> toJson() => _$AadharKycToJson(this);
}

@JsonSerializable()
class PanKyc{
  PanKyc({
    this.status,
    this.msg,
    this.nameMatch,
    this.dataType,
  });


  @JsonKey(name:'status')
  dynamic status;

  @JsonKey(name:'msg')
  String? msg;

  @JsonKey(name:'name_match')
  dynamic nameMatch;

  @JsonKey(name:'dataType')
  String? dataType;


  factory PanKyc.fromJson(Map<String, dynamic> json) =>
      _$PanKycFromJson(json);


  Map<String, dynamic> toJson() => _$PanKycToJson(this);
}

@JsonSerializable()
class BankKyc{
  BankKyc({
    this.status,
    this.msg,
    this.nameMatch,
    this.dataType,
  });


  @JsonKey(name:'status')
  dynamic status;

  @JsonKey(name:'msg')
  String? msg;

  @JsonKey(name:'name_match')
  dynamic nameMatch;

  @JsonKey(name:'dataType')
  String? dataType;


  factory BankKyc.fromJson(Map<String, dynamic> json) =>
      _$BankKycFromJson(json);

  Map<String, dynamic> toJson() => _$BankKycToJson(this);
}


@JsonSerializable()
class  KycUserDetails
{
  KycUserDetails({
    this.userType,
    this.userId

  });


  @JsonKey(name:'user_type')
  String? userType;


  @JsonKey(name:'user_id')
  String? userId;


  factory KycUserDetails.fromJson(Map<String, dynamic> json) =>
      _$KycUserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$KycUserDetailsToJson(this);
}