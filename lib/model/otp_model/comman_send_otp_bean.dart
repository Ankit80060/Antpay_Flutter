import 'package:json_annotation/json_annotation.dart';

part 'comman_send_otp_bean.g.dart';

@JsonSerializable()
class CommonSendOtpRequestModel {
  @JsonKey(name: 'mobile')
  String? mobile;

  @JsonKey(name: 'service')
  String? service;

  @JsonKey(name: 'aParam')
  String? aParam;

  CommonSendOtpRequestModel({
    this.mobile,
    this.service,
    this.aParam

  });

  factory CommonSendOtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CommonSendOtpRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommonSendOtpRequestModelToJson(this);
}
@JsonSerializable()
class CommonSendOtpResponseModel {
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'msg')
  String? msg;

  CommonSendOtpResponseModel({
    this.status,
    this.msg,
  });

  factory CommonSendOtpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CommonSendOtpResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommonSendOtpResponseModelToJson(this);
}
