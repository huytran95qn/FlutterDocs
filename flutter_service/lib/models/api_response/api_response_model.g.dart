// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIResponse _$APIResponseFromJson(Map<String, dynamic> json) {
  return APIResponse(
    result: json['result'],
    targetUrl: json['targetUrl'] as String,
    success: json['success'] as bool,
    error: json['error'] as String,
    unAuthorizedRequest: json['unAuthorizedRequest'] as bool,
  );
}

Map<String, dynamic> _$APIResponseToJson(APIResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'targetUrl': instance.targetUrl,
      'success': instance.success,
      'error': instance.error,
      'unAuthorizedRequest': instance.unAuthorizedRequest,
    };
