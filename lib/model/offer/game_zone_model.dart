import 'package:json_annotation/json_annotation.dart';
part 'game_zone_model.g.dart';

@JsonSerializable()
class GameZoneModel {
  final String status;
  final String msg;
  final List<GameZoneData> data;

  GameZoneModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory GameZoneModel.fromJson(Map<String, dynamic> json) =>
      _$GameZoneModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameZoneModelToJson(this);
}

@JsonSerializable()
class GameZoneData {
  final String name;
  final String banner;

  GameZoneData({
    required this.name,
    required this.banner,
  });

  factory GameZoneData.fromJson(Map<String, dynamic> json) =>
      _$GameZoneDataFromJson(json);

  Map<String, dynamic> toJson() => _$GameZoneDataToJson(this);
}
