import 'package:car_rental/features/payment_process/domain/entities/payment_request_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_request_model.g.dart';

@JsonSerializable()
class PaymentRequestModel {
    int amount;
    String firstName;
    String lastName;
    String email;
    String phoneNumber;
    String? city;
    String? country;
    String paymentType;
    PaymentRequestModel({
        required this.amount,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.phoneNumber,
         this.city,
         this.country,
        required this.paymentType,
    });
    factory  PaymentRequestModel.fromEntity(PaymentRequestEntity entity){
     return PaymentRequestModel(
      amount: entity.amount,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      city: entity.city,
      country: entity.country,
      paymentType: entity.paymentType
     ); 
     }
    factory PaymentRequestModel.fromJson(Map<String, dynamic> json) => 
      _$PaymentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentRequestModelToJson(this);
    
}