import 'package:json_annotation/json_annotation.dart';
part 'full_kyc_model.g.dart';

@JsonSerializable()
class FullKycRequest{
  FullKycRequest({
    this.mobile,
    this.fullName,
    this.email,
    this.pan,
    this.aadhar,
    this.dob,
    this.gender,
    this.accountNo,
    this.cAccountNo,
    this.bankName,
    this.ifsc,
    this.occuption_id,
    this.company_type,
    this.company_name,
    this.company_code,
    this.highest_qualification,
    this.net_monthly_income,
    this.r_pincode,
  this.r_state,
  this.r_city,

    this.userType,
    this.source,
    this.product,
  });


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
  @JsonKey(name:'dob')
  String? dob;
  @JsonKey(name:'gender')
  String? gender;

  @JsonKey(name:'r_pincode')
  String? r_pincode;
  @JsonKey(name:'r_state')
  String? r_state;
  @JsonKey(name:'r_city')
  String? r_city;


  @JsonKey(name:'account_no')
  String? accountNo;

  @JsonKey(name:'caccount_no')
  String? cAccountNo;

  @JsonKey(name:'bank_name')
  String? bankName;

  @JsonKey(name:'ifsc_code')
  String? ifsc;

  @JsonKey(name:'occuption_id')
  String? occuption_id;

  @JsonKey(name:'company_type')
  String? company_type;

  @JsonKey(name:'company_name')
  String? company_name;

  @JsonKey(name:'company_code')
  String? company_code;

  @JsonKey(name:'highest_qualification')
  String? highest_qualification;

  @JsonKey(name:'net_monthly_income')
  String? net_monthly_income;

  @JsonKey(name:'user_type')
  String? userType;

  @JsonKey(name:'source')
  String? source;

  @JsonKey(name:'product')
  String? product;


  factory FullKycRequest.fromJson(Map<String, dynamic> json) =>
      _$FullKycRequestFromJson(json);

  Map<String, dynamic> toJson() => _$FullKycRequestToJson(this);
}

@JsonSerializable()
class KycResponse{

  KycResponse({
    this.user_details,
    this.kycResponse,
  });

  @JsonKey(name:'user_details')
  UserDetailResp? user_details;

  @JsonKey(name:'aadhar_kyc')
  FullKycResponse? kycResponse;

  factory KycResponse.fromJson(Map<String, dynamic> json) =>
      _$KycResponseFromJson(json);

  Map<String, dynamic> toJson() => _$KycResponseToJson(this);
}

@JsonSerializable()
class UserDetailResp{
  UserDetailResp({
    this.user_type,
    this.user_id,
  });


  @JsonKey(name:'user_type')
  String? user_type;

  @JsonKey(name:'user_id')
  dynamic? user_id;


  factory UserDetailResp.fromJson(Map<String, dynamic> json) =>
      _$UserDetailRespFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailRespToJson(this);
}


@JsonSerializable()
class FullKycResponse{
  FullKycResponse({
    this.kycUniqueId,
    this.aadharResponse,
  });


  @JsonKey(name:'kyc_unique_id')
  String? kycUniqueId;

  @JsonKey(name:'aadhar_response')
  AadharResponse? aadharResponse;

  factory FullKycResponse.fromJson(Map<String, dynamic> json) =>
      _$FullKycResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FullKycResponseToJson(this);
}

@JsonSerializable()
class AadharResponse{
  AadharResponse({
    this.code,
    this.model,
    this.msg,
    this.errorCode,
  });


  @JsonKey(name:'code')
  String? code;

  @JsonKey(name:'model')
  ResponseModel? model;

  @JsonKey(name:'msg')
  String? msg;

  @JsonKey(name:'errorCode')
  String? errorCode;

  factory AadharResponse.fromJson(Map<String, dynamic> json) =>
      _$AadharResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AadharResponseToJson(this);
}

@JsonSerializable()
class ResponseModel{
  ResponseModel({
    this.adharNumber,
    this.uniqueId,
    this.referenceId,
    this.maskedAdharNumber,
    this.name,
    this.gender,
    this.dob,
    this.careOf,
    this.passCode,
    this.link,
    this.address,
    this.image,
    this.transactionId,
    this.fwdp,
    this.codeVerifier,
    this.uidaiResponse,
  });


  @JsonKey(name:'adharNumber')
  String? adharNumber;

  @JsonKey(name:'uniqueId')
  String? uniqueId;

  @JsonKey(name:'referenceId')
  String? referenceId;

  @JsonKey(name:'maskedAdharNumber')
  String? maskedAdharNumber;

  @JsonKey(name:'name')
  String? name;

  @JsonKey(name:'gender')
  String? gender;

  @JsonKey(name:'dob')
  String? dob;

  @JsonKey(name:'careOf')
  String? careOf;

  @JsonKey(name:'passCode')
  String? passCode;

  @JsonKey(name:'link')
  String? link;

  @JsonKey(name:'address')
  Address? address;

  @JsonKey(name:'image')
  String? image;

  @JsonKey(name:'transactionId')
  String? transactionId;

  @JsonKey(name:'fwdp')
  String? fwdp;

  @JsonKey(name:'codeVerifier')
  String? codeVerifier;

  @JsonKey(name:'uidaiResponse')
  UidaiResponse? uidaiResponse;

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}

@JsonSerializable()
class Address{
  Address({
    this.house,
    this.street,
    this.landmark,
    this.loc,
    this.po,
    this.dist,
    this.subdist,
    this.vtc,
    this.pc,
    this.state,
    this.country,
  });


  @JsonKey(name:'house')
  String? house;

  @JsonKey(name:'street')
  String? street;

  @JsonKey(name:'landmark')
  String? landmark;

  @JsonKey(name:'loc')
  String? loc;

  @JsonKey(name:'po')
  String? po;

  @JsonKey(name:'dist')
  String? dist;

  @JsonKey(name:'subdist')
  String? subdist;

  @JsonKey(name:'vtc')
  String? vtc;

  @JsonKey(name:'pc')
  String? pc;

  @JsonKey(name:'state')
  String? state;

  @JsonKey(name:'country')
  String? country;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class UidaiResponse{
  UidaiResponse({
    this.message,
    this.sessionActive,
    this.status,
  });

  @JsonKey(name:'message')
  String? message;

  @JsonKey(name:'sessionActive')
  String? sessionActive;

  @JsonKey(name:'status')
  String? status;

  factory UidaiResponse.fromJson(Map<String, dynamic> json) =>
      _$UidaiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UidaiResponseToJson(this);
}