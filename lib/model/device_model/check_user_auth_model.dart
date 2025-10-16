import 'package:json_annotation/json_annotation.dart';

part 'check_user_auth_model.g.dart';

@JsonSerializable()
class CheckUserAuthModel {
  CheckUserAuthModel({this.tokenStatus});

  @JsonKey(name: "token_status")
  bool? tokenStatus;


  factory CheckUserAuthModel.fromJson(Map<String, dynamic> json) => _$CheckUserAuthModelFromJson(json);
  Map<String, dynamic> toJson() => _$CheckUserAuthModelToJson(this);
}
