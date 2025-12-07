import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SelectedWidget extends StatelessWidget {
 final  String textHeadline;
 final IconData iconData;
 final String content;
 final String toggleText;
 void Function()? onTap;
   SelectedWidget({super.key, required this.textHeadline,
     required this.iconData,
     required this.toggleText,
     required this.content,this.onTap});

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding:  EdgeInsets.all(AppSize.s16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            textHeadline,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const RSizedBox(height: 10),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding:  EdgeInsets.symmetric(horizontal: AppSize.s16.w, vertical: AppSize.s12.h),
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.grey),
                borderRadius: BorderRadius.circular(AppSize.s10.r),
              ),
              child: Row(
                children: [
                   Icon(iconData, color: Colors.green),
                  const RSizedBox(width: 10),
                  Expanded(
                    child: Text(
                        content,
                        style: Theme.of(context).textTheme.titleMedium
                    ),
                  ),
                  InkWell(onTap: onTap,
                    child: Row(
                      children: [
                        Text(
                          toggleText,
                            style: Theme.of(context).textTheme.displayMedium
                        ),
                         Icon(Icons.arrow_forward_ios, size: 16, color: ColorManager.green),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
