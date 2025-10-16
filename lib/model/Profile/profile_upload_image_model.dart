import 'package:json_annotation/json_annotation.dart';

part 'profile_upload_image_model.g.dart';

@JsonSerializable()
class ProfilePicUploadRequest {
  final String mobile;

  @JsonKey(name: 'profile_pic')
  final String profilePic;

  @JsonKey(name: 'aParam', includeIfNull: false)
  final String? aParam;

  ProfilePicUploadRequest({
    required this.mobile,
    required this.profilePic,
    this.aParam,
  });

  factory ProfilePicUploadRequest.fromJson(Map<String, dynamic> json) =>
      _$ProfilePicUploadRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePicUploadRequestToJson(this);
}


@JsonSerializable()
class ProfilePicUploadResponse {
  final String status;
  final String pic;
  final String msg;

  ProfilePicUploadResponse({
    required this.status,
    required this.pic,
    required this.msg,
  });

  factory ProfilePicUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfilePicUploadResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePicUploadResponseToJson(this);
}
