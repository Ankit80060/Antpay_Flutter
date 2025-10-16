import 'package:json_annotation/json_annotation.dart';

part 'company_list.g.dart';

@JsonSerializable()
class CompanyList {

  CompanyList({
    this.company_list,
  });

  @JsonKey(name:'company_list')
  List<Company>? company_list;

  factory CompanyList.fromJson(Map<String, dynamic> json) =>
      _$CompanyListFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyListToJson(this);
}

@JsonSerializable()
class Company {
  Company({
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

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
