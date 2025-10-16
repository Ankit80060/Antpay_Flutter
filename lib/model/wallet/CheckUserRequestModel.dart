import 'package:json_annotation/json_annotation.dart';

part 'CheckUserRequestModel.g.dart';


@JsonSerializable()
class CheckUserRequestModel {
  @JsonKey(name: 'action_name')
  String? actionName;
  @JsonKey(name: 'p1')
  String? p1;

  CheckUserRequestModel({this.actionName,this.p1});

  factory CheckUserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CheckUserRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckUserRequestModelToJson(this);
}





