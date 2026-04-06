import 'package:json_annotation/json_annotation.dart';

part 'payment_response_model.g.dart';
@JsonSerializable()
class PaymentResponseModel {
  final String iframeUrl;
  final String token;

  PaymentResponseModel({
    required this.iframeUrl,
    required this.token,
  });

  
    factory PaymentRequestModel.fromJson(Map<String, dynamic> json) => 
      _$PaymentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentRequestModelToJson(this);
}