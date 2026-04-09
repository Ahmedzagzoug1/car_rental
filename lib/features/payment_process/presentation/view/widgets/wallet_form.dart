import 'package:car_rental/features/payment_process/domain/entities/payment_type.dart';
import 'package:car_rental/features/payment_process/presentation/cubit/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class WalletForm extends StatefulWidget {
  const WalletForm({super.key});

  @override
  State<WalletForm> createState() => _WalletFormState();
}

class _WalletFormState extends State<WalletForm> {
  GlobalKey<FormState> _walletFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _walletFormKey,
      child:  Column(
      children: [
                 Text('Enter your mobile wallet number to proceed with the payment',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey),),

        const SizedBox(height: 16),
        IntlPhoneField(
              initialCountryCode: 'EG',
              decoration: InputDecoration(
                hintText: "Phone Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              
              onChanged: (phone) {
                
    bool isValid = false;
    try {
      isValid = phone.isValidNumber(); 
    } catch (e) {
      isValid = false;
    }
// Update the form status in the cubit based on the validity of the phone number
    context.read<PaymentCubit>().updateFormStatus(isValid, PaymentType.wallet);
  
              },
            ),
             const SizedBox(height: 16),

                 Text('You will be redirected to paymob to complete your payment',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),),

      ],
    ));
  }
}