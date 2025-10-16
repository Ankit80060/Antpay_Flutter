import 'package:json_annotation/json_annotation.dart';

part 'investment_response.g.dart';

@JsonSerializable()
class InvestmentResponse {
  @JsonKey(name: "UserData")
  List<InvestmentProduct>? userData;

  InvestmentResponse({this.userData});

  factory InvestmentResponse.fromJson(Map<String, dynamic> json) =>
      _$InvestmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InvestmentResponseToJson(this);
}

@JsonSerializable()
class InvestmentProduct {
  String? id;

  @JsonKey(name: "investment_product")
  String? investmentProduct;

  @JsonKey(name: "icon_url")
  String? iconUrl;

  @JsonKey(name: "icon_url_new")
  String? iconUrlNew;

  String? status;

  InvestmentProduct({
    this.id,
    this.investmentProduct,
    this.iconUrl,
    this.iconUrlNew,
    this.status,
  });

  factory InvestmentProduct.fromJson(Map<String, dynamic> json) =>
      _$InvestmentProductFromJson(json);

  Map<String, dynamic> toJson() => _$InvestmentProductToJson(this);
}
