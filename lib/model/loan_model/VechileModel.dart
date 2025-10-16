import 'package:json_annotation/json_annotation.dart';

part 'VechileModel.g.dart';

@JsonSerializable()
class VehcileData{
  final int status;

  @JsonKey(name: 'message')
  final String msg;

  @JsonKey(name:'data')
  final List<VehicleModel> models;

  VehcileData({
    required this.status,
    required this.msg,
    required this.models,
  });

  // Factory method for JSON deserialization
  factory VehcileData.fromJson(Map<String, dynamic> json) => _$VehcileDataFromJson(json);

  Map<String, dynamic> toJson() => _$VehcileDataToJson(this);
}



@JsonSerializable()
class VehicleModel {
  @JsonKey(name:"vehiclemodelcode")
  String vehiclemodelcode;
  @JsonKey(name:"vehiclemodelVariante")
  String vehiclemodelVariante;
  @JsonKey(name:"txt_fuel")
  String txtFuel;

  VehicleModel({
    required this.vehiclemodelcode,
    required this.vehiclemodelVariante,
    required this.txtFuel,
  });
  factory VehicleModel.fromJson(Map<String, dynamic> json) => _$VehicleModelFromJson(json);
  Map<String, dynamic> toJson() => _$VehicleModelToJson(this);
}

