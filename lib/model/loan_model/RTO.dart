import 'package:json_annotation/json_annotation.dart';

part 'RTO.g.dart';

@JsonSerializable()
class RtoResponse {
  final String message;
  final int status;

  @JsonKey(name: 'data')
  final List<RtoData> data;

  RtoResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory RtoResponse.fromJson(Map<String, dynamic> json) =>
      _$RtoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RtoResponseToJson(this);
}

@JsonSerializable()
class RtoData {
  final String id;
  @JsonKey(name: 'rto_code')
  final String rtoCode;
  @JsonKey(name: 'registration_state_city')
  final String registrationStateCity;
  @JsonKey(name: 'registration_state_city_code')
  final String registrationStateCityCode;
  @JsonKey(name: 'vehicle_class_code')
  final String vehicleClassCode;
  @JsonKey(name: 'num_state_id')
  final String numStateId;
  @JsonKey(name: 'txt_state_sub_name')
  final String txtStateSubName;
  @JsonKey(name: 'num_state_sub_code')
  final String numStateSubCode;
  final String product;

  RtoData({
    required this.id,
    required this.rtoCode,
    required this.registrationStateCity,
    required this.registrationStateCityCode,
    required this.vehicleClassCode,
    required this.numStateId,
    required this.txtStateSubName,
    required this.numStateSubCode,
    required this.product,
  });

  factory RtoData.fromJson(Map<String, dynamic> json) =>
      _$RtoDataFromJson(json);

  Map<String, dynamic> toJson() => _$RtoDataToJson(this);
}
