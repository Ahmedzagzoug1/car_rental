import 'package:equatable/equatable.dart';

class PaymentRequestEntity  extends Equatable {
    int amount;
    String firstName;
    String lastName;
    String email;
    String phoneNumber;
    String? city;
    String? country;
    String paymentType;
    PaymentRequestEntity({
        required this.amount,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.phoneNumber,
                required this.paymentType,
         this.city,
         this.country,
    });
    
      @override
      List<Object?> get props => [
        amount,
        firstName,
        lastName,
        email,
        phoneNumber,
        city,
        country,
        paymentType
      ];
}