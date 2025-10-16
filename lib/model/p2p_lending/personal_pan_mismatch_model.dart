import 'package:json_annotation/json_annotation.dart';

part 'personal_pan_mismatch_model.g.dart';

@JsonSerializable()
class PersonalPanMisMatchRequestModel {
  PersonalPanMisMatchRequestModel(
      {this.phone, this.lender_id, this.msg, this.source});

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'lender_id')
  String? lender_id;

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'source')
  String? source;

  factory PersonalPanMisMatchRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalPanMisMatchRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PersonalPanMisMatchRequestModelToJson(this);
}

@JsonSerializable()
class PersonalPanMisMatchResponseModel {
  PersonalPanMisMatchResponseModel({this.status, this.msg});

  @JsonKey(name: 'status')
  dynamic status;

  @JsonKey(name: 'msg')
  String? msg;

  factory PersonalPanMisMatchResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PersonalPanMisMatchResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalPanMisMatchResponseModelToJson(this);

}
