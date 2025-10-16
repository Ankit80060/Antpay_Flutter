import 'package:json_annotation/json_annotation.dart';
part 'qualification_model.g.dart';

@JsonSerializable()
class Qualification{
  Qualification({
    this.status,
    this.list,
  });


  @JsonKey(name:'status')
  dynamic status;

  @JsonKey(name:'qualification_list')
  List<QualificationList>? list;

  factory Qualification.fromJson(Map<String, dynamic> json) =>
      _$QualificationFromJson(json);

  Map<String, dynamic> toJson() => _$QualificationToJson(this);
}

@JsonSerializable()
class QualificationList{
  QualificationList({
    this.id,
    this.qualification,
  });


  @JsonKey(name:'id')
  String? id;

  @JsonKey(name:'qualification')
  String? qualification;

  factory QualificationList.fromJson(Map<String, dynamic> json) =>
      _$QualificationListFromJson(json);

  Map<String, dynamic> toJson() => _$QualificationListToJson(this);
}
