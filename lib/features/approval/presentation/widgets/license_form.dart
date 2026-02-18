import 'package:car_rental/features/approval/presentation/cubits/ocr_cubit/ocr_cubit.dart';
import 'package:car_rental/features/approval/presentation/cubits/ocr_cubit/ocr_cubit.dart';
import 'package:car_rental/features/approval/presentation/widgets/custom_drop_down_button.dart';
import 'package:car_rental/features/approval/presentation/widgets/custom_text_field.dart';
import 'package:car_rental/features/approval/presentation/widgets/form_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LicenseForm extends StatelessWidget {
   String? ocrCountry;
  LicenseForm({super.key});

  TextEditingController fullTimeController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<OcrCubit, OcrState>(
        listener: (context, state) {
          if (state is OcrLoaded) {
            fullTimeController.text = state.licenseEntity.fullName ?? '';
            expirationDateController.text = state.licenseEntity.expirationDate ?? '';
            dateOfBirthController.text = state.licenseEntity.dateOfBirth ?? '';

          }
          if(state is OcrFailure){
           ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(content: Text('sorry, the ocr cannot work. please try again or fill the fields '))) ;
          }
          },
      builder: (context, state) {
        if (state is OcrLoaded)  {
          ocrCountry = state.licenseEntity.country;
        }
        return Column(
          children: [
            if (state is OcrLoading) const LinearProgressIndicator(),

            FormSection(
              title: 'Full Name',
              hint: 'Enter your full name',
              controller: fullTimeController,

            ),
            const SizedBox(height: 24),

             CustomDropDownButton(
              hintText: 'Select country',
               ocrCountry:ocrCountry ,
onChanged: (value){
ocrCountry=value;
},
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: FormSection(
                    title: 'Expiration Date',
                    hint: 'dd/mm/yyyy',
                    controller: expirationDateController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FormSection(
                    title: 'Date of Birth',
                    hint: 'dd/mm/yyyy',
                    controller: dateOfBirthController,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
