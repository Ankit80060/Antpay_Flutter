import 'package:json_annotation/json_annotation.dart';

part 'announcement_model.g.dart';


@JsonSerializable()
class AnnouncementRequestModel{

  AnnouncementRequestModel({
    this.mobile,
    this.source,
    this.aParam,
  });

  @JsonKey(name: 'mobile')
  String? mobile;

  @JsonKey(name: 'source')
  String? source;

  @JsonKey(name: 'aParam')
  String? aParam;



  factory AnnouncementRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementRequestModelToJson(this);

}

@JsonSerializable()
class AnnouncementResponseModel{


  AnnouncementResponseModel({
    this.status,
    this.msg,
    this.announcementList,

  });

  @JsonKey(name: 'status')
  dynamic status;

  @JsonKey(name: 'msg')
  String? msg;

  @JsonKey(name: 'announcement_list')
  List<AnnouncementList>? announcementList;


  factory AnnouncementResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementResponseModelToJson(this);

}


@JsonSerializable()
class AnnouncementList{


  AnnouncementList({
    this.imgUrl,
    this.title,
    this.createdDate,
  });

  @JsonKey(name: 'img_url')
  dynamic imgUrl;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'created_date')
  String? createdDate;


  factory AnnouncementList.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementListFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementListToJson(this);

}