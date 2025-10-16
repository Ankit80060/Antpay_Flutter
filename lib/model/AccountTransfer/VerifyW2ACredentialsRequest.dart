import 'package:json_annotation/json_annotation.dart';

part 'VerifyW2ACredentialsRequest.g.dart';

@JsonSerializable()
class VerifyW2ACredentialsRequest {

  @JsonKey(name: "customerMobile")
  String? mobileNumber;

  @JsonKey(name: "aParam")
  String? aParam;

  @JsonKey(name: "deviceId")
  String? deviceId;

  @JsonKey(name: "mpin")
  String? mpin;

  @JsonKey(name: "token")
  String? token;

  VerifyW2ACredentialsRequest({this.mobileNumber,this.aParam,this.deviceId,this.mpin,this.token});

  factory VerifyW2ACredentialsRequest.fromJson(Map<String, dynamic> json) => _$VerifyW2ACredentialsRequestFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyW2ACredentialsRequestToJson(this);


}
