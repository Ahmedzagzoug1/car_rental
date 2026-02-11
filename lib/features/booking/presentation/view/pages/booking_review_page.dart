import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/core/shared_components/shared_pages/error_page.dart';
import 'package:car_rental/core/shared_components/shared_widgets/bottom_widget.dart';
import 'package:car_rental/core/shared_components/shared_widgets/display_time_and_date.dart';
import 'package:car_rental/features/booking/presentation/cubit/booking_cubit/booking_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/time_cubit/time_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/trip_date_cubit/trip_date_cubit.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/car_review_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/payment_detail_row.dart';
   class BookingReviewPage extends StatefulWidget {


  const BookingReviewPage({
    super.key,
  });

  @override
  State<BookingReviewPage> createState() => _RequestBookState();
}

class _RequestBookState extends State<BookingReviewPage> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Request to Book',
          style: Theme.of(context).textTheme.headlineLarge,

        ),
        backgroundColor: ColorManager.white,
        elevation: 0,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios, color: ColorManager.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:BlocConsumer<BookingCubit, BookingState>(
          listener: (context, state) {
            if (state is BookingFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errMessage), backgroundColor: Colors.red),
              );
            }
          },
          builder: (context, state) {
            if (state is BookingInitial || state is BookingLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is BookingFinished) {
      final bookingEntity = state.bookingEntity;
      final timeEntity =bookingEntity.timeEntity;
      final carEntity =bookingEntity.carDetailsEntity;
      final locationEntity = bookingEntity.pickupLocation;
      return SingleChildScrollView(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CarReviewWidget(),
            const RSizedBox(height: 24),

             Text(
              'Trip Date & Time',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const RSizedBox(height: 12),
            BlocBuilder<TripDateCubit, TripDateState>(
              builder: (context, state) {
                return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12
                        .h),
                    decoration: BoxDecoration(
                      color: ColorManager.emeraldGreen05,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: DisplayTimeAndDate(timeEntity: timeEntity,)

                );
              },
            ),
            const RSizedBox(height: 24),

            // Pickup & Return Section
             Text(
              'Pickup & Return',
              style: Theme.of(context).textTheme.headlineLarge,
      ),
            const RSizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.location_on, color: ColorManager.green),
                const RSizedBox(width: 8),
                Text(
                 '${ locationEntity.title} , ${ locationEntity.subtitle}' ,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            const RSizedBox(height: 24),

            // Payment Details Section
             Text(
              'Payment Details',
              style: Theme.of(context).textTheme.headlineLarge,

            ),
            const RSizedBox(height: 12), Container(
              color: ColorManager.charcoalBlack05,
              child:
              Padding(padding: EdgeInsets.all(16),
                child: Column(

                children: [
                  PaymentDetailRow(
                    label: '\$${carEntity?. pricePerHour.toStringAsFixed(2)} x ${carEntity
                        ?.trips} days',
                    value: '\$${carEntity?.pricePerHour.toStringAsFixed(2)}',
                  ),
                  PaymentDetailRow(label: 'Trip fee',
                      value: '\$${carEntity?.pricePerHour.toStringAsFixed(2)}'),
                   PaymentDetailRow(
                      label: 'Discount', value: '-'),
                  const RPadding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(),
                  ),
                  PaymentDetailRow(
                    label: 'Total Amount',
                    labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: ColorManager.black),
                    valueStyle: Theme.of(context).textTheme.headlineLarge,
                    value: '\$${carEntity?.pricePerHour.toStringAsFixed(2)}',

                  ),
                ],
              ),
            ),),
            const RSizedBox(height: 8),


          ],
        ),
      );
    } else {
return  ErrorPage(message: 'there are an expected error!\n please try again', onRetry: (){
  Navigator.pop(context);
});
    }
  }),
        bottomNavigationBar: BottomWidget(price: '300',
            subtitle: 'Total Amount',
            onPressed: (){
              Navigator.pushNamedAndRemoveUntil(context, AppRouter.approvedPage,(predict){
                return false;
              });
            },
            btnText: 'Proceed to Pay')
    );
  }

}
