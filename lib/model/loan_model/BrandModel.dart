import 'package:json_annotation/json_annotation.dart';

part 'BrandModel.g.dart';

@JsonSerializable()
class BrandModel {
  final int? status;

  @JsonKey(name: 'message')
  final String? msg;

  @JsonKey(name: 'data')
  final List<Brands>? brands;

  BrandModel({
    required this.status,
    required this.msg,
    required this.brands,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandModelToJson(this);
}

@JsonSerializable()
class Brands {
  final String? id;
  final String? manufacturer;
  final String? vehiclemodelcode;
  final String? vehiclemodel;
  final String? numberofwheels;
  final String? cubiccapacity;
  final String? grossvehicleweight;
  final String? seatingcapacity;
  final String? carringcapacity;
  final String? txt_fuel;
  final String? txt_variant;

  Brands({
    required this.id,
    required this.manufacturer,
    required this.vehiclemodelcode,
    required this.vehiclemodel,
    required this.numberofwheels,
    required this.cubiccapacity,
    required this.grossvehicleweight,
    required this.seatingcapacity,
    required this.carringcapacity,
    required this.txt_fuel,
    required this.txt_variant,
  });

  // Factory method for JSON deserialization
  factory Brands.fromJson(Map<String, dynamic> json) => _$BrandsFromJson(json);

  // Method for JSON serialization
  Map<String, dynamic> toJson() => _$BrandsToJson(this);
}
