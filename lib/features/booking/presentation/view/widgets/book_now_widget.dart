import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/core/shared_components/shared_widgets/custom_button.dart';
import 'package:car_rental/features/booking/domain/entities/booking_entity.dart';
import 'package:car_rental/features/booking/presentation/cubit/booking_cubit/booking_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/time_cubit/time_cubit.dart';
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
            child: BlocConsumer<BookingCubit, BookingState>(
  listener: (context, state) {
if(state is BookingFinished){


  Navigator.pushNamed(context, AppRouter.bookingReviewPage);

}
else if (state is BookingFailure) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(state.errMessage), backgroundColor: ColorManager.red),
  );
}}, builder:(context, state){
    return CustomButton(title: 'Book Now',
                onPressed: () {

                  final timeState = context.read<TimeCubit>().state;
                  final carState = context.read<CarDetailsCubit>().state;
                  final locState = context.read<LocationCubit>().state;

                  context.read<BookingCubit>().processBooking(
                    timeState: timeState,
                    carState: carState,
                    locState: locState,
                  );
                },
isLoading: state is BookingLoading,);
},
              ),

            )

        ],
      ),
    );
  }}