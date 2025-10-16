import 'package:json_annotation/json_annotation.dart';

part 'profile_image_model.g.dart';

@JsonSerializable()
class ProfilePicRequest {
  final String mobile;
  final String aParam;

  ProfilePicRequest({
    required this.mobile,
    required this.aParam,
  });

  factory ProfilePicRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfilePicRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePicRequestToJson(this);
}

@JsonSerializable()
class ProfilePicResponse {
  final String status;
  final String? pic;
  final String msg;

  ProfilePicResponse({
    required this.status,
    this.pic,
    required this.msg,
  });

  factory ProfilePicResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfilePicResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePicResponseToJson(this);
}
