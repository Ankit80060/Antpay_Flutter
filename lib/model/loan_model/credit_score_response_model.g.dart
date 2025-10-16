// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_score_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditScoreResponse _$CreditScoreResponseFromJson(Map<String, dynamic> json) =>
    CreditScoreResponse(
      status: json['status'] as String,
      msg: json['msg'] as String,
      score: json['score'] as String,
      creditScoreRequestType: json['creditScoreRequestType'] as String,
      xmlFilePath: json['xmlFilePath'] as String,
      userId: json['userId'] as String,
      dataType: json['dataType'] as String,
      updatedOn: json['updated_on'] as String,
      requestXmlDataResp: RequestXmlDataResp.fromJson(
          json['requestXmlDataResp'] as Map<String, dynamic>),
      experianCurl: json['experianCurl'] as String,
      savingCreditScoreResponseXmlInFile:
          json['savingCreditScoreResponseXmlInFile'] as String,
      xmlParseResp:
          XmlParseResp.fromJson(json['xmlParseResp'] as Map<String, dynamic>),
      getSavedCreditScore: GetSavedCreditScore.fromJson(
          json['getSavedCreditScore'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreditScoreResponseToJson(
        CreditScoreResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'score': instance.score,
      'creditScoreRequestType': instance.creditScoreRequestType,
      'xmlFilePath': instance.xmlFilePath,
      'userId': instance.userId,
      'dataType': instance.dataType,
      'updated_on': instance.updatedOn,
      'requestXmlDataResp': instance.requestXmlDataResp,
      'experianCurl': instance.experianCurl,
      'savingCreditScoreResponseXmlInFile':
          instance.savingCreditScoreResponseXmlInFile,
      'xmlParseResp': instance.xmlParseResp,
      'getSavedCreditScore': instance.getSavedCreditScore,
    };

RequestXmlDataResp _$RequestXmlDataRespFromJson(Map<String, dynamic> json) =>
    RequestXmlDataResp(
      status: json['status'] as String,
      msg: json['msg'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$RequestXmlDataRespToJson(RequestXmlDataResp instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };

XmlParseResp _$XmlParseRespFromJson(Map<String, dynamic> json) => XmlParseResp(
      status: json['status'] as String,
      msg: json['msg'] as String,
      data: XmlParseRespData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$XmlParseRespToJson(XmlParseResp instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
    };

XmlParseRespData _$XmlParseRespDataFromJson(Map<String, dynamic> json) =>
    XmlParseRespData(
      score: json['score'] as String,
      sumOfCurrentBalance: (json['sum_of_currentbalance'] as num).toInt(),
      sumOfAdjustedCurrentCreditForSecured:
          (json['sum_of_adjusted_current_credit_for_secured'] as num).toInt(),
      sumOfAdjustedCurrentCreditForUnsecured:
          (json['sum_of_adjusted_current_credit_for_unsecured'] as num).toInt(),
      sumOfOverdueAmount: (json['sum_of_overdue_amount'] as num).toInt(),
      totalNoOfActiveAccount:
          (json['total_no_of_active_account'] as num).toInt(),
      termCreditToTotalCredit:
          (json['term_credit_to_total_credit'] as num).toInt(),
      numberOfInstancesDelay:
          (json['number_of_instances_delay'] as num).toInt(),
      pastInstancesOfSettlementWriteOff:
          (json['past_instances_of_settlement_write_off'] as num).toInt(),
      filePath: json['file_path'] as String,
    );

Map<String, dynamic> _$XmlParseRespDataToJson(XmlParseRespData instance) =>
    <String, dynamic>{
      'score': instance.score,
      'sum_of_currentbalance': instance.sumOfCurrentBalance,
      'sum_of_adjusted_current_credit_for_secured':
          instance.sumOfAdjustedCurrentCreditForSecured,
      'sum_of_adjusted_current_credit_for_unsecured':
          instance.sumOfAdjustedCurrentCreditForUnsecured,
      'sum_of_overdue_amount': instance.sumOfOverdueAmount,
      'total_no_of_active_account': instance.totalNoOfActiveAccount,
      'term_credit_to_total_credit': instance.termCreditToTotalCredit,
      'number_of_instances_delay': instance.numberOfInstancesDelay,
      'past_instances_of_settlement_write_off':
          instance.pastInstancesOfSettlementWriteOff,
      'file_path': instance.filePath,
    };

GetSavedCreditScore _$GetSavedCreditScoreFromJson(Map<String, dynamic> json) =>
    GetSavedCreditScore(
      status: json['status'] as String,
      msg: json['msg'] as String,
      data: GetSavedCreditScoreData.fromJson(
          json['data'] as Map<String, dynamic>),
      createdDate: json['created_date'] as String,
      updatedOn: json['updated_on'] as String,
      table: json['table'] as String,
    );

Map<String, dynamic> _$GetSavedCreditScoreToJson(
        GetSavedCreditScore instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'data': instance.data,
      'created_date': instance.createdDate,
      'updated_on': instance.updatedOn,
      'table': instance.table,
    };

GetSavedCreditScoreData _$GetSavedCreditScoreDataFromJson(
        Map<String, dynamic> json) =>
    GetSavedCreditScoreData(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      mobile: json['mobile'] as String,
      score: json['score'] as String,
      requestData: json['request_data'] as String,
      errorString: json['errorString'] as String,
      stageOneId: json['stageOneId_'] as String,
      stageTwoId: json['stageTwoId_'] as String,
      experianFile: json['experian_file'] as String,
      experianXmlFile: json['experian_xml_file'] as String,
      experianRating: json['experian_rating'] as String,
      experianSource: json['experian_source'] as String,
      updatedOn: json['updated_on'] as String,
      createdDate: json['created_date'] as String,
      filePath: json['filePath'] as String,
    );

Map<String, dynamic> _$GetSavedCreditScoreDataToJson(
        GetSavedCreditScoreData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'mobile': instance.mobile,
      'score': instance.score,
      'request_data': instance.requestData,
      'errorString': instance.errorString,
      'stageOneId_': instance.stageOneId,
      'stageTwoId_': instance.stageTwoId,
      'experian_file': instance.experianFile,
      'experian_xml_file': instance.experianXmlFile,
      'experian_rating': instance.experianRating,
      'experian_source': instance.experianSource,
      'updated_on': instance.updatedOn,
      'created_date': instance.createdDate,
      'filePath': instance.filePath,
    };
