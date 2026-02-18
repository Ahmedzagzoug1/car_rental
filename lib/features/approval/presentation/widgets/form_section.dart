import 'package:car_rental/features/approval/presentation/widgets/custom_drop_down_button.dart';
import 'package:car_rental/features/approval/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
class FormSection extends StatelessWidget {
  final String title;
  final String hint;
  final bool isDropDown ;
  final TextEditingController controller;
  String? ocrCountry ;
  Function(String?)? onChanged;

   FormSection({super.key, required this.title,
    required this.hint, this.ocrCountry, this.isDropDown=false, required this.controller,
   this.onChanged});

  @override
  Widget build(BuildContext context) {
  return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(height: 8),
    Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
    border: Border.all(color: Colors.grey[300]!),
    borderRadius: BorderRadius.circular(8),
    ),
    child:isDropDown?CustomDropDownButton(hintText: hint,):
    CustomTextField(title: title, hint: hint,controller: controller,))
    ]);

  }
}
