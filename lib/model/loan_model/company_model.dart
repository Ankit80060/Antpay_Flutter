import 'package:json_annotation/json_annotation.dart';
part 'company_model.g.dart';

@JsonSerializable()
class CompanyResponse {
  CompanyResponse({
    this.status,
    this.companyList,
  });

  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'company_list')
  List<CompanyList>? companyList;

  factory CompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyResponseToJson(this);
}

@JsonSerializable()
class CompanyList {
  CompanyList({
    this.id,
    this.companyName,
    this.companyCategory,
  });

  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'company_name')
  String? companyName;

  @JsonKey(name: 'company_category')
  String? companyCategory;

  factory CompanyList.fromJson(Map<String, dynamic> json) =>
      _$CompanyListFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyListToJson(this);
}
