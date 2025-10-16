
import 'package:json_annotation/json_annotation.dart';

part 'GetCategoriesBean.g.dart';

@JsonSerializable()
class SchemesInvestmentResonseModel{
  SchemesInvestmentResonseModel({
    this.schemesList,
});
  @JsonKey(name: 'results')
  List<results>? schemesList;

  factory SchemesInvestmentResonseModel.fromJson(Map<String, dynamic> json) =>
      _$SchemesInvestmentResonseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SchemesInvestmentResonseModelToJson(this);

}

@JsonSerializable()
class results {
  results({
    this.Service_Name,
    this.service,
    this.service_categories_img,
    this.service_categories_img_new
});

  @JsonKey(name: 'Service_Name')
  String? Service_Name;
 @JsonKey(name: 'service')
  String? service;
 @JsonKey(name: 'service_categories_img')
  String? service_categories_img;
 @JsonKey(name: 'service_categories_img_new')
  String? service_categories_img_new;

  factory results.fromJson(Map<String, dynamic> json) =>
      _$resultsFromJson(json);

  Map<String, dynamic> toJson() => _$resultsToJson(this);



}