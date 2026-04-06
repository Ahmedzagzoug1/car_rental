import 'package:json_annotation/json_annotation.dart';

part 'payment_request_model.g.dart';
@JsonSerializable()
class PaymentRequestModel {
    int amount;
    String firstName;
    String lastName;
    String email;
    String phoneNumber;
    String city;
    String country;

    PaymentRequestModel({
        required this.amount,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.phoneNumber,
        required this.city,
        required this.country,
    });
    factory PaymentRequestModel.fromJson(Map<String, dynamic> json) => 
      _$PaymentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentRequestModelToJson(this);
}