import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/core/shared_components/shared_widgets/bottom_widget.dart';
import 'package:car_rental/features/booking/presentation/cubit/booking_cubit/booking_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BookNowWidget extends StatelessWidget {
  final double pricePerHour;
  final double originalPrice;

  const BookNowWidget({
    super.key,
    required this.pricePerHour,
    required this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: AppSize.s20.w, vertical: AppSize.s12.h),
      decoration: BoxDecoration(
        color: ColorManager.grey,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s16.r),topRight: Radius.circular(AppSize.s16.r)),
        boxShadow: [
          BoxShadow(
            color: ColorManager.black.withOpacity(0.3),
            spreadRadius: AppSize.s2.r,
            blurRadius: AppSize.s7.r,
            offset:  Offset(AppSize.s0, AppSize.s3.h),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '\$${pricePerHour.toStringAsFixed(2)}/h', // Current price
                 style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                '\$${originalPrice.toStringAsFixed(2)}', // Original (crossed-out) price
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16.0,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          const RSizedBox(width: 30.0),

          Expanded(
            child: ElevatedButton(
              onPressed: () {
                final booking = context.read<BookingCubit>();


                final car = (context.read<CarDetailsCubit>().state as CarDetailsLoaded).carDetailsEntity;
                booking.setCarDetails(car);

                final errorMessage = booking.getMissingFieldsMessage();

                if (errorMessage == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Booking review complete')),
                  );
                  Navigator.pushNamed(context, AppRouter.bookingReviewPage);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(errorMessage)),
                  );
                }

              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child:  Text(
                'Book Now',
                style:    Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }}