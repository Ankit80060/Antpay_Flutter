

import 'package:json_annotation/json_annotation.dart';

part 'lender_kyc_status_model.g.dart';

@JsonSerializable()
class LenderKycStatusRequestModel{

  LenderKycStatusRequestModel({
    this.phone,
    this.source
});

  @JsonKey(name:"phone")
  String? phone;

  @JsonKey(name:"source")
  String? source;

  factory LenderKycStatusRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LenderKycStatusRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LenderKycStatusRequestModelToJson(this);

}

@JsonSerializable()
class LenderKycStatusResponseModel{

  LenderKycStatusResponseModel({
    this.status,
    this.kyc_status
});

  @JsonKey(name:"status")
  dynamic status;

  @JsonKey(name:"kyc_status")
  LenderKycStatus? kyc_status;

  factory LenderKycStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LenderKycStatusResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LenderKycStatusResponseModelToJson(this);

}

@JsonSerializable()
class LenderKycStatus {

  LenderKycStatus({
    this.lender_id,
    this.step,
    this.msg,

});

  @JsonKey(name: 'lender_id')
  String? lender_id;

  @JsonKey(name: 'step')
  dynamic step;

  @JsonKey(name: 'msg')
  String? msg;

  factory LenderKycStatus.fromJson(Map<String, dynamic> json) =>
      _$LenderKycStatusFromJson(json);

  Map<String, dynamic> toJson() => _$LenderKycStatusToJson(this);

}