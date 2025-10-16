// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_history_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointHistoryBean _$PointHistoryBeanFromJson(Map<String, dynamic> json) =>
    PointHistoryBean(
      status: (json['status'] as num?)?.toInt(),
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$PointHistoryBeanToJson(PointHistoryBean instance) =>
    <String, dynamic>{
      'status': instance.status,
      'transactions': instance.transactions,
      'pagination': instance.pagination,
      'msg': instance.msg,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as String?,
      mobile: json['mobile'] as String?,
      reference1: json['reference_1'] as String?,
      reference2: json['reference_2'] as String?,
      transactionType: json['transaction_type'] as String?,
      transactionPoint: json['transaction_point'] as String?,
      balance: json['balance'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mobile': instance.mobile,
      'reference_1': instance.reference1,
      'reference_2': instance.reference2,
      'transaction_type': instance.transactionType,
      'transaction_point': instance.transactionPoint,
      'balance': instance.balance,
      'created_at': instance.createdAt,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      totalRecord: json['total_record'] as String?,
      perPage: json['per_page'] as String?,
      currentPage: json['current_page'] as String?,
      totalPages: json['total_pages'] as String?,
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'total_record': instance.totalRecord,
      'per_page': instance.perPage,
      'current_page': instance.currentPage,
      'total_pages': instance.totalPages,
    };

pointHistoryRequestPOJO _$pointHistoryRequestPOJOFromJson(
        Map<String, dynamic> json) =>
    pointHistoryRequestPOJO(
      mobile: json['mobile'] as String?,
      pageNo: json['page_no'] as String?,
      fromDate: json['from_date'] as String?,
      toDate: json['to_date'] as String?,
      aParam: json['aParam'] as String?,
    );

Map<String, dynamic> _$pointHistoryRequestPOJOToJson(
        pointHistoryRequestPOJO instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'page_no': instance.pageNo,
      'from_date': instance.fromDate,
      'to_date': instance.toDate,
      'aParam': instance.aParam,
    };
