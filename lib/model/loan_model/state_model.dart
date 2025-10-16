import 'package:json_annotation/json_annotation.dart';

part 'state_model.g.dart';

@JsonSerializable()
class StateResponse {
  final String message;
  final int status;
  final List<StateData> data;

  StateResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory StateResponse.fromJson(Map<String, dynamic> json) =>
      _$StateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StateResponseToJson(this);
}

@JsonSerializable()
class StateData {
  final String id;

  @JsonKey(name: 'num_state_cd')
  final String numStateCd;

  @JsonKey(name: 'txt_state')
  final String txtState;

  @JsonKey(name: 'num_region_cd')
  final String numRegionCd;

  @JsonKey(name: 'txt_region')
  final String txtRegion;

  StateData({
    required this.id,
    required this.numStateCd,
    required this.txtState,
    required this.numRegionCd,
    required this.txtRegion,
  });

  factory StateData.fromJson(Map<String, dynamic> json) =>
      _$StateDataFromJson(json);

  Map<String, dynamic> toJson() => _$StateDataToJson(this);
}
