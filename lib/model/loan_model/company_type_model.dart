import 'package:json_annotation/json_annotation.dart';
part 'company_type_model.g.dart';

@JsonSerializable()
class CompanyType{
  CompanyType({
    this.list,
  });


  @JsonKey(name:'company_type')
  List<String>? list;

  factory CompanyType.fromJson(Map<String, dynamic> json) =>
      _$CompanyTypeFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyTypeToJson(this);
}
