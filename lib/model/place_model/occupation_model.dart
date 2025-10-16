import 'package:json_annotation/json_annotation.dart';
part 'occupation_model.g.dart';

@JsonSerializable()
class Occupation{
  Occupation({
    this.status,
    this.list,
  });


  @JsonKey(name:'status')
  dynamic status;

  @JsonKey(name:'occupation_list')
  List<OccupationList>? list;

  factory Occupation.fromJson(Map<String, dynamic> json) =>
      _$OccupationFromJson(json);

  Map<String, dynamic> toJson() => _$OccupationToJson(this);
}


@JsonSerializable()
class OccupationList{
  OccupationList({
    this.id,
    this.occupation,
  });


  @JsonKey(name:'id')
  String? id;

  @JsonKey(name:'name')
  String? occupation;

  factory OccupationList.fromJson(Map<String, dynamic> json) =>
      _$OccupationListFromJson(json);

  Map<String, dynamic> toJson() => _$OccupationListToJson(this);
}
