import 'package:car_rental/features/payment_process/domain/entities/payment_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_response_model.g.dart';
@JsonSerializable()
class PaymentResponseModel {
  final String? iframeUrl;
  final String? token;
  final int? orderId;
  final String? paymentType;
  final String? redirectUrl;
  PaymentResponseModel({
     this.iframeUrl,
     this.token,
    this.orderId,
    this.paymentType,
    this.redirectUrl
  });
/*
"orderId": 501446712,
    "paymentType": "kiosk",
    "redirectUrl":*/
  
    factory PaymentResponseModel.fromJson(Map<String, dynamic> json) => 
      _$PaymentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentResponseModelToJson(this);
  PaymentResponseEntity toEntity() {
    return PaymentResponseEntity(iframeUrl: iframeUrl, token: token,
     orderId: orderId, paymentType: paymentType, redirectUrl: redirectUrl);
  }
}