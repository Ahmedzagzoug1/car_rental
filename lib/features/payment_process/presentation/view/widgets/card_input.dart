import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardInput extends StatelessWidget {
  final String hint;
  final String? Function(String?)? validator;
final List<TextInputFormatter>? inputFormatters;
final TextInputType? keyboardType;
final void Function(String)? onChanged;
  const CardInput({super.key, required this.hint, this.validator, 
  this.inputFormatters, this.keyboardType, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
              validator: validator,
inputFormatters:inputFormatters ,
keyboardType: keyboardType,
onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        isDense: true,
      ),
    );  }
}