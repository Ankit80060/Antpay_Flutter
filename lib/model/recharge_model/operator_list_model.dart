

import 'package:json_annotation/json_annotation.dart';
part 'operator_list_model.g.dart';


@JsonSerializable()
class OperatorList{
  OperatorList({
    this.result

});

  @JsonKey(name: 'results')
  List<Results>? result;

  factory OperatorList.fromJson(Map<String, dynamic> json) =>
      _$OperatorListFromJson(json);

  Map<String, dynamic> toJson() => _$OperatorListToJson(this);





}

@JsonSerializable()
class Results {
  Results({
    this.id,
    this.service,
    this.operator,
    this.operator_code,
    this.status
});

  @JsonKey(name:'id')
  String? id;

  @JsonKey(name:'service')
  String? service;

  @JsonKey(name:'operator')
  String? operator;

  @JsonKey(name:'operator_code')
  String? operator_code;

  @JsonKey(name:'status')
  String? status;

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);


}