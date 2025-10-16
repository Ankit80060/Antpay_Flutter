// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_upload_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfilePicUploadRequest _$ProfilePicUploadRequestFromJson(
        Map<String, dynamic> json) =>
    ProfilePicUploadRequest(
      mobile: json['mobile'] as String,
      profilePic: json['profile_pic'] as String,
      aParam: json['aParam'] as String?,
    );

Map<String, dynamic> _$ProfilePicUploadRequestToJson(
    ProfilePicUploadRequest instance) {
  final val = <String, dynamic>{
    'mobile': instance.mobile,
    'profile_pic': instance.profilePic,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('aParam', instance.aParam);
  return val;
}

ProfilePicUploadResponse _$ProfilePicUploadResponseFromJson(
        Map<String, dynamic> json) =>
    ProfilePicUploadResponse(
      status: json['status'] as String,
      pic: json['pic'] as String,
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$ProfilePicUploadResponseToJson(
        ProfilePicUploadResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'pic': instance.pic,
      'msg': instance.msg,
    };
