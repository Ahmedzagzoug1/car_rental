import 'package:flutter/material.dart';
class CustomDropDownButton extends StatelessWidget {
  final String hintText ;
   String? ocrCountry ;
  Function(String?)? onChanged;
   CustomDropDownButton({super.key, required this.hintText,this.ocrCountry,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isExpanded: true,
        value:mapOcrToDropdown(ocrCountry)??'select country',
        hint: Text(hintText, style: TextStyle(color: Colors.grey)),
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        onChanged:onChanged,
        items: <String>['US', 'Eg', 'GB','select country']
            .map<DropdownMenuItem<String>>((String val) {
          return DropdownMenuItem<String>(
            value: val,
            child: Text(
              val,
              style: const TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
      ),
    );

  }
  String? mapOcrToDropdown(String? ocrCountry) {
    if (ocrCountry == 'Egypt') return 'Eg';
    if (ocrCountry == 'USA') return 'US';

    return ocrCountry;
  }
}
