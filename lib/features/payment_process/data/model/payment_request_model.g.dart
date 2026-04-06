// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRequestModel _$PaymentRequestModelFromJson(Map<String, dynamic> json) =>
    PaymentRequestModel(
      amount: (json['amount'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$PaymentRequestModelToJson(
        PaymentRequestModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'city': instance.city,
      'country': instance.country,
    };
