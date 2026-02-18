import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  bool isDate;
  final TextEditingController controller;
   CustomTextField({super.key, required this.title, required this.hint, required this.controller,
  this.isDate=false});

  @override
  Widget build(BuildContext context) {
    
    return TextField(

      controller:controller ,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,

              hintStyle: const TextStyle(color: Colors.grey),
            ),
      readOnly:isDate? true:false,
      onTap: () => isDate? _selectDate(context):(){},);
  }
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      String formattedDate =
          "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      controller.text = formattedDate;
    }
  }
}

