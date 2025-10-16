

import 'package:json_annotation/json_annotation.dart';

part 'AddBeneOtplRequest.g.dart';

@JsonSerializable()
class AddBeneOtplRequest{

  @JsonKey(name:"aParam")
  String? aParam;
  @JsonKey(name:"service")
  String? service;
  @JsonKey(name:"mobile")
  String? mobile;
  @JsonKey(name:"otp")
  String? otp;

  AddBeneOtplRequest({this.aParam,this.service,this.mobile,this.otp});

  factory AddBeneOtplRequest.fromJson(Map<String, dynamic> json) => _$AddBeneOtplRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AddBeneOtplRequestToJson(this);


}