
import 'package:json_annotation/json_annotation.dart';

part 'user_personal_details_model.g.dart';

@JsonSerializable()
class UserPersonalDetailsRequestModel{
  UserPersonalDetailsRequestModel({
    this.device_id,
    this.app_version,
    this.DOB,
    this.email,
    this.fullname,
    this.gender,
    this.pan,
    this.phone,
    this.vendor_id,
    this.source
  });

  @JsonKey(name:'device_id')
  String? device_id;

  @JsonKey(name:'app_version')
  String? app_version;

  @JsonKey(name:'DOB')
  String? DOB;

  @JsonKey(name:'email')
  String? email;

  @JsonKey(name:'fullname')
  String? fullname;

  @JsonKey(name:'gender')
  String? gender;

  @JsonKey(name:'PAN')
  String? pan;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'vendor_id')
  String? vendor_id;

  @JsonKey(name: 'source')
  String? source;

  factory UserPersonalDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserPersonalDetailsRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserPersonalDetailsRequestModelToJson(this);


}

@JsonSerializable()
class UserPersonalDetailsResponseModel{

  UserPersonalDetailsResponseModel({
    this.status,
    this.user_id,
    this.lender_id,
    this.authorization,
    this.msg
});

  @JsonKey(name:'status')
  dynamic status;

  @JsonKey(name:'user_id')
  int? user_id;

  @JsonKey(name:'lender_id')
  String? lender_id;

  @JsonKey(name:'Authorization')
  String? authorization;

  @JsonKey(name:'msg')
  String? msg;

  factory UserPersonalDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserPersonalDetailsResponseModelFromJson(
          json);

  Map<String, dynamic> toJson() => _$UserPersonalDetailsResponseModelToJson(this);




}