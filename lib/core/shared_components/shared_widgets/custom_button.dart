import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String title;
 final void Function()? onPressed;
  const CustomButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ElevatedButton(onPressed:onPressed,

            style: Theme.of(context).elevatedButtonTheme.style,
            child: Text(title )
        ),
      ),
    );
  }
}
