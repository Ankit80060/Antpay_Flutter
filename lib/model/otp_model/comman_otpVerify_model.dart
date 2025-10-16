import 'package:json_annotation/json_annotation.dart';

part 'comman_otpVerify_model.g.dart';


@JsonSerializable()
class CommanUserOtpVerifyRequestModel {
  @JsonKey(name: 'mobile')
  String? mobile;

  @JsonKey(name: 'otp')
  String? otp;

  @JsonKey(name: 'service')
  String? service;

  CommanUserOtpVerifyRequestModel({
    this.mobile,
    this.otp,
    this.service,
  });

  factory CommanUserOtpVerifyRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CommanUserOtpVerifyRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CommanUserOtpVerifyRequestModelToJson(this);
}


@JsonSerializable()
class CommanUserOtpVerifyResponseModel {
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'oath_token')
  String? oathToken;

  @JsonKey(name: 'msg')
  String? msg;

  CommanUserOtpVerifyResponseModel({
  this.status,
  this.oathToken,
  this.msg,

  });

  factory CommanUserOtpVerifyResponseModel.fromJson(Map<String, dynamic> json) =>
  _$CommanUserOtpVerifyResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
  _$CommanUserOtpVerifyResponseModelToJson(this);
}
