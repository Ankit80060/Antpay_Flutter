import 'package:json_annotation/json_annotation.dart';

part 'credit_card_response_model.g.dart';

@JsonSerializable()
class CreditCardPaymentResponseModel {

  @JsonKey(name: "result")
  final ResultModel? result;

  @JsonKey(name: "exception")
  final dynamic exception;

  @JsonKey(name: "pagination")
  final dynamic pagination;

  @JsonKey(name: "txnid")
  final int? txnid;

  CreditCardPaymentResponseModel({
    this.result,
    this.exception,
    this.pagination,
    this.txnid,

  });


  factory CreditCardPaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreditCardPaymentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreditCardPaymentResponseModelToJson(this);

  // @override
  // String toString() {
  //   return 'CreditCardPaymentResponseModel(result: \$result, exception: \$exception, pagination: \$pagination, txnid: \$txnid)';
  // }
}

@JsonSerializable()
class ResultModel {

  @JsonKey(name: "status")
  String? status;

  ResultModel(this.status);

  factory ResultModel.fromJson(Map<String, dynamic> json) => _$ResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
}
