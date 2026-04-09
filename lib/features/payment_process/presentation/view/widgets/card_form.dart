import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/core/resources/assets_manager.dart';
import 'package:car_rental/core/utils/card_validators.dart';
import 'package:car_rental/features/payment_process/domain/entities/payment_type.dart';
import 'package:car_rental/features/payment_process/presentation/cubit/cubit/payment_cubit.dart';
import 'package:car_rental/features/payment_process/presentation/view/widgets/card_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardForm extends StatefulWidget {
  const CardForm({super.key});

  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
      CardType? cardType;
GlobalKey<FormState> _cardFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUnfocus,
      key: _cardFormKey,
      child: Column(
        children: [
     SizedBox(
  height: AppSize.s40,
  child: (cardType == null|| cardType == CardType.unknown) 
      ? const SizedBox() 
      : Image(image: AssetImage(ImageAssets.cardLogos[cardType]!),
      errorBuilder: (context, error, stackTrace) =>
    const   Icon(Icons.credit_card, size: 30, color: Colors.grey),),
),
 

          CardInput(hint: 'Card Number',
          validator: CardValidators.validateCardNumber,
          inputFormatters: [CardNumberFormatter()],
          keyboardType: TextInputType.number,
           onChanged: (value) {
//update the card type based on the number entered
  final type = CardValidators.getCardTypeFromNumber(value);
  if (type != cardType) {
    setState(() {
      cardType = type;
    });
  }

  // الـ Focus Move
  if (value.length == 19) {
    _updateCubit(); // Update the cubit with the current form status
    FocusScope.of(context).nextFocus();
  }
},),


          const SizedBox(height: 8),
          // Name on Card is required by some gateways like Paymob even if it doesn't affect the payment process
          CardInput(hint: 'Name on Card',
          keyboardType: TextInputType.name,
          validator: (value) {
  if (value == null || value.trim().isEmpty) return 'Name is required';
  if (value.trim().length < 3) return 'Name is too short';
  return null;
},
           onChanged: (value) {
            _updateCubit(); // Update the cubit with the current form status whenever the name changes
           },)
  ,
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: CardInput(hint: 'MM/YY',
              validator: CardValidators.validateExpiry,
              inputFormatters: [CardMonthInputFormatter(),
              ],
              keyboardType: TextInputType.number,
               onChanged: (value) {
               
        if (value.length == 5) {
      FocusScope.of(context).nextFocus();
      _updateCubit();
        }
      },)),
              const SizedBox(width: 8),
              Expanded(child: CardInput(hint: 'CVV',
              keyboardType: TextInputType.number,
             onChanged: (value) {
  int limit = (cardType == CardType.amex) ? 4 : 3;
  if (value.length == limit) {
    FocusScope.of(context).unfocus();
    _updateCubit();
  }
},)),
            ],
          ),
          const SizedBox(height: 8),
           Text(
            'Please ensure your card can be used for online transactions.',
            style: TextStyle(fontSize: 12, color: ColorManager.grey),
          ),
        ],
      ),
    );
  }
  // دالة مساعدة جوه الـ State عشان مكررش الكود
void _updateCubit() {
  // بنعمل delay بسيط عشان نضمن إن الـ Form أخد آخر قيمة
  Future.delayed(Duration.zero, () {
    final isValid = _cardFormKey.currentState?.validate() ?? false;
    context.read<PaymentCubit>().updateFormStatus(isValid, PaymentType.card);
  });
}
}