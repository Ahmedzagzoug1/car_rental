// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentResponseModel _$PaymentResponseModelFromJson(
        Map<String, dynamic> json) =>
    PaymentResponseModel(
      iframeUrl: json['iframeUrl'] as String?,
      token: json['token'] as String?,
      orderId: json['orderId'] as int?,
      paymentType: json['paymentType'] as String?,
      redirectUrl: json['redirectUrl'] as String?,
    );

Map<String, dynamic> _$PaymentResponseModelToJson(
        PaymentResponseModel instance) =>
    <String, dynamic>{
      'iframeUrl': instance.iframeUrl,
      'token': instance.token,
      'orderId': instance.orderId,
      'paymentType': instance.paymentType,
      'redirectUrl': instance.redirectUrl,
    };
