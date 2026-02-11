import 'package:car_rental/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomButton extends StatelessWidget {
  final String title;
  final isLoading;
 final void Function()? onPressed;
  const CustomButton({super.key,this.isLoading=false, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ElevatedButton(onPressed:onPressed,

            style: Theme.of(context).elevatedButtonTheme.style,
            child:isLoading?  SizedBox(
                height: 20.r,
                width: 20.r,
                child: CircularProgressIndicator(color: ColorManager.primary,
                  strokeWidth: 2.r,)): Text(title )
        ),
      ),
    );
  }
}
