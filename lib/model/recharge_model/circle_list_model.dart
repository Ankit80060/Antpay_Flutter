

import 'package:json_annotation/json_annotation.dart';
part 'circle_list_model.g.dart';


@JsonSerializable()
class CircleList{
  CircleList({
    this.result

});

  @JsonKey(name: 'results')
  List<Result>? result;

  factory CircleList.fromJson(Map<String, dynamic> json) =>
      _$CircleListFromJson(json);

  Map<String, dynamic> toJson() => _$CircleListToJson(this);





}

@JsonSerializable()
class Result {
  

  Result({
    this.id,
    this.circle,
    this.circle_code

});

  @JsonKey(name:'id')
  String? id;

  @JsonKey(name:'circle')
  String? circle;

  @JsonKey(name:'circle_code')
  String? circle_code;


  factory Result.fromJson(Map<String, dynamic> json) =>
      _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);


}