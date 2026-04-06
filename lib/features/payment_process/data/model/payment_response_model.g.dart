// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentResponseModel _$PaymentResponseModelFromJson(
        Map<String, dynamic> json) =>
    PaymentResponseModel(
      iframeUrl: json['iframeUrl'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$PaymentResponseModelToJson(
        PaymentResponseModel instance) =>
    <String, dynamic>{
      'iframeUrl': instance.iframeUrl,
      'token': instance.token,
    };
