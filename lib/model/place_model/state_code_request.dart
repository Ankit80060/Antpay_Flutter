

import 'package:json_annotation/json_annotation.dart';
part 'state_code_request.g.dart';
@JsonSerializable()
class StateCodeRequest{
    StateCodeRequest({
        this.state_code
    });

    @JsonKey(name:'state_code')
    String? state_code;

    factory StateCodeRequest.fromJson(Map<String, dynamic> json) =>
        _$StateCodeRequestFromJson(json);

    Map<String, dynamic> toJson() => _$StateCodeRequestToJson(this);
}
