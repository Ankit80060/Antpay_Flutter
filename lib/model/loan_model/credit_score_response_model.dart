import 'package:json_annotation/json_annotation.dart';

part 'credit_score_response_model.g.dart';

@JsonSerializable()
class CreditScoreResponse {
  final String status;  
  final String msg;
  final String score;
  @JsonKey(name: 'creditScoreRequestType')
  final String creditScoreRequestType;
  final String xmlFilePath;
  @JsonKey(name: 'userId')
  final String userId;
  final String dataType;
  @JsonKey(name: 'updated_on')
  final String updatedOn;
  @JsonKey(name: 'requestXmlDataResp')
  final RequestXmlDataResp requestXmlDataResp;
  final String experianCurl;
  @JsonKey(name: 'savingCreditScoreResponseXmlInFile')
  final String savingCreditScoreResponseXmlInFile;
  @JsonKey(name: 'xmlParseResp')
  final XmlParseResp xmlParseResp;
  @JsonKey(name: 'getSavedCreditScore')
  final GetSavedCreditScore getSavedCreditScore;

  CreditScoreResponse({
    required this.status,
    required this.msg,
    required this.score,
    required this.creditScoreRequestType,
    required this.xmlFilePath,
    required this.userId,
    required this.dataType,
    required this.updatedOn,
    required this.requestXmlDataResp,
    required this.experianCurl,
    required this.savingCreditScoreResponseXmlInFile,
    required this.xmlParseResp,
    required this.getSavedCreditScore,
  });

  factory CreditScoreResponse.fromJson(Map<String, dynamic> json) =>
      _$CreditScoreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreditScoreResponseToJson(this);
}

@JsonSerializable()
class RequestXmlDataResp {
  final String status;
  final String msg;
  final String data;

  RequestXmlDataResp({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory RequestXmlDataResp.fromJson(Map<String, dynamic> json) =>
      _$RequestXmlDataRespFromJson(json);

  Map<String, dynamic> toJson() => _$RequestXmlDataRespToJson(this);
}

@JsonSerializable()
class XmlParseResp {
  final String status;
  final String msg;
  final XmlParseRespData data;

  XmlParseResp({
    required this.status,
    required this.msg,
    required this.data,
  });

  factory XmlParseResp.fromJson(Map<String, dynamic> json) =>
      _$XmlParseRespFromJson(json);

  Map<String, dynamic> toJson() => _$XmlParseRespToJson(this);
}

@JsonSerializable()
class XmlParseRespData {
  final String score;
  @JsonKey(name: 'sum_of_currentbalance')
  final int sumOfCurrentBalance;
  @JsonKey(name: 'sum_of_adjusted_current_credit_for_secured')
  final int sumOfAdjustedCurrentCreditForSecured;
  @JsonKey(name: 'sum_of_adjusted_current_credit_for_unsecured')
  final int sumOfAdjustedCurrentCreditForUnsecured;
  @JsonKey(name: 'sum_of_overdue_amount')
  final int sumOfOverdueAmount;
  @JsonKey(name: 'total_no_of_active_account')
  final int totalNoOfActiveAccount;
  @JsonKey(name: 'term_credit_to_total_credit')
  final int termCreditToTotalCredit;
  @JsonKey(name: 'number_of_instances_delay')
  final int numberOfInstancesDelay;
  @JsonKey(name: 'past_instances_of_settlement_write_off')
  final int pastInstancesOfSettlementWriteOff;
  @JsonKey(name: 'file_path')
  final String filePath;

  XmlParseRespData({
    required this.score,
    required this.sumOfCurrentBalance,
    required this.sumOfAdjustedCurrentCreditForSecured,
    required this.sumOfAdjustedCurrentCreditForUnsecured,
    required this.sumOfOverdueAmount,
    required this.totalNoOfActiveAccount,
    required this.termCreditToTotalCredit,
    required this.numberOfInstancesDelay,
    required this.pastInstancesOfSettlementWriteOff,
    required this.filePath,
  });

  factory XmlParseRespData.fromJson(Map<String, dynamic> json) =>
      _$XmlParseRespDataFromJson(json);

  Map<String, dynamic> toJson() => _$XmlParseRespDataToJson(this);
}

@JsonSerializable()
class GetSavedCreditScore {
  final String status;
  final String msg;
  final GetSavedCreditScoreData data;
  @JsonKey(name: 'created_date')
  final String createdDate;
  @JsonKey(name: 'updated_on')
  final String updatedOn;
  final String table;

  GetSavedCreditScore({
    required this.status,
    required this.msg,
    required this.data,
    required this.createdDate,
    required this.updatedOn,
    required this.table,
  });

  factory GetSavedCreditScore.fromJson(Map<String, dynamic> json) =>
      _$GetSavedCreditScoreFromJson(json);

  Map<String, dynamic> toJson() => _$GetSavedCreditScoreToJson(this);
}

@JsonSerializable()
class GetSavedCreditScoreData {
  final String id;
  @JsonKey(name: 'user_id')
  final String? userId;
  final String mobile;
  final String score;
  @JsonKey(name: 'request_data')
  final String requestData;
  @JsonKey(name: 'errorString')
  final String errorString;
  @JsonKey(name: 'stageOneId_')
  final String stageOneId;
  @JsonKey(name: 'stageTwoId_')
  final String stageTwoId;
  @JsonKey(name: 'experian_file')
  final String experianFile;
  @JsonKey(name: 'experian_xml_file')
  final String experianXmlFile;
  @JsonKey(name: 'experian_rating')
  final String experianRating;
  @JsonKey(name: 'experian_source')
  final String experianSource;
  @JsonKey(name: 'updated_on')
  final String updatedOn;
  @JsonKey(name: 'created_date')
  final String createdDate;
  @JsonKey(name: 'filePath')
  final String filePath;

  GetSavedCreditScoreData({
    required this.id,
    this.userId,
    required this.mobile,
    required this.score,
    required this.requestData,
    required this.errorString,
    required this.stageOneId,
    required this.stageTwoId,
    required this.experianFile,
    required this.experianXmlFile,
    required this.experianRating,
    required this.experianSource,
    required this.updatedOn,
    required this.createdDate,
    required this.filePath,
  });

  factory GetSavedCreditScoreData.fromJson(Map<String, dynamic> json) =>
      _$GetSavedCreditScoreDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetSavedCreditScoreDataToJson(this);
}