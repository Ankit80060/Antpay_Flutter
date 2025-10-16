import 'package:json_annotation/json_annotation.dart';

part 'state_model.g.dart';

@JsonSerializable()
class StateModel {
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'state_list')
  List<StateList>? stateList;

  StateModel({this.status, this.stateList});

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);

  Map<String, dynamic> toJson() => _$StateModelToJson(this);
}

@JsonSerializable()
class StateList {
  @JsonKey(name: 'state')
  String? state;

  @JsonKey(name: 'code')
  String? code;

  StateList({this.state, this.code});

  factory StateList.fromJson(Map<String, dynamic> json) => _$StateListFromJson(json);

  Map<String, dynamic> toJson() => _$StateListToJson(this);
}
