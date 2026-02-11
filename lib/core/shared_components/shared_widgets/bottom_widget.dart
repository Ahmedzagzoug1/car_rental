import 'package:car_rental/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/value_manager.dart';
class BottomWidget extends StatelessWidget {
  final String btnText;
  final String price;
  final String subtitle;
  void Function()? onPressed;
  BottomWidget({super.key, required this.price, required this.subtitle,
    required this.btnText, onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      // بادينج يمين وشمال
      decoration: BoxDecoration(
        color: ColorManager.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.s35.r),
          topRight: Radius.circular(AppSize.s35.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // بيزق النص شمال والزرار يمين
        crossAxisAlignment: CrossAxisAlignment.center,
        // بيسنترهم رأسياً
        children: [
          // الجزء الخاص بالسعر والعنوان الفرعي
          Column(
            mainAxisSize: MainAxisSize.min,
            // عشان مياخدش طول الـ row كله
            crossAxisAlignment: CrossAxisAlignment.start,
            // يخلي الكلام تحت بعضه من الشمال
            children: [
              Text(
                price,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(
                  color: Colors.white, // تأكد إن اللون أبيض عشان الخلفية سودة
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(
                  color: Colors.grey, // لون باهت للـ subtitle
                ),
              ),
            ],
          ),

          // الزرار
          SizedBox(
            height: 51.h,
            width: 195.w,
            child: ElevatedButton(
              onPressed: onPressed,
              style: Theme
                  .of(context)
                  .elevatedButtonTheme
                  .style?.
              copyWith(backgroundColor:WidgetStateProperty.all(ColorManager.primary)),
              child: Text(
                btnText,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}