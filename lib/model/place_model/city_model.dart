import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
class City {
  @JsonKey(name: 'id')
    String id;

  @JsonKey(name: 'city_name')
  String cityName;

  @JsonKey(name: 'state_code')
    String stateCode;


  City({required this.id, required this.cityName, required this.stateCode});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class CityListResponse {
  @JsonKey(name: 'status')
    int status;

  @JsonKey(name: 'city_list')
    List<City> cityList;


  CityListResponse({required this.status, required this.cityList});

  factory CityListResponse.fromJson(Map<String, dynamic> json) =>
      _$CityListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CityListResponseToJson(this);
}
