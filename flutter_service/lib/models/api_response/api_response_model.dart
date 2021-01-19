import 'package:json_annotation/json_annotation.dart';
part 'api_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class APIResponse {
  dynamic result;
  String targetUrl;
  bool success;
  String error;
  bool unAuthorizedRequest;

  APIResponse(
      {this.result,
        this.targetUrl,
        this.success,
        this.error,
        this.unAuthorizedRequest});


  factory APIResponse.fromJson(Map<String, dynamic> json) => _$APIResponseFromJson(json);

  Map<String, dynamic> toJson() => _$APIResponseToJson(this);

}
