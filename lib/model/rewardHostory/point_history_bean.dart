import 'package:json_annotation/json_annotation.dart';

part 'point_history_bean.g.dart';

@JsonSerializable()
class PointHistoryBean {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "transactions")
  List<Transaction>? transactions;
  @JsonKey(name: "pagination")
  Pagination? pagination;
  @JsonKey(name: "msg")
  String? msg;

  PointHistoryBean({this.status, this.transactions, this.pagination, this.msg});

  factory PointHistoryBean.fromJson(Map<String, dynamic> json) => _$PointHistoryBeanFromJson(json);

  Map<String?, dynamic> toJson() => _$PointHistoryBeanToJson(this);
}

@JsonSerializable()
class Transaction {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "mobile")
  String? mobile;

  @JsonKey(name: "reference_1")
  String? reference1;

  @JsonKey(name: "reference_2")
  String? reference2;

  @JsonKey(name: "transaction_type")
  String? transactionType;

  @JsonKey(name: "transaction_point")
  String? transactionPoint;

  @JsonKey(name: "balance")
  String? balance;

  @JsonKey(name: "created_at")
  String? createdAt;

  Transaction({
    this.id,
    this.mobile,
    this.reference1,
    this.reference2,
    this.transactionType,
    this.transactionPoint,
    this.balance,
    this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);

}

@JsonSerializable()
class Pagination {
  @JsonKey(name: "total_record")
  String? totalRecord;
  @JsonKey(name: "per_page")
  String? perPage;
  @JsonKey(name: "current_page")
  String? currentPage;
  @JsonKey(name: "total_pages")
  String? totalPages;

  Pagination({
    this.totalRecord,
    this.perPage,
    this.currentPage,
    this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class pointHistoryRequestPOJO {
  @JsonKey(name: "mobile")
  String? mobile;
  @JsonKey(name: "page_no")
  String? pageNo;
  @JsonKey(name: "from_date")
  String? fromDate;
  @JsonKey(name: "to_date")
  String? toDate;
  @JsonKey(name: "aParam")
  String? aParam;

  pointHistoryRequestPOJO(
      {this.mobile, this.pageNo, this.fromDate, this.toDate,this.aParam});

  factory pointHistoryRequestPOJO.fromJson(Map<String, dynamic> json) =>
      _$pointHistoryRequestPOJOFromJson(json);

  Map<String, dynamic> toJson() => _$pointHistoryRequestPOJOToJson(this);
}
