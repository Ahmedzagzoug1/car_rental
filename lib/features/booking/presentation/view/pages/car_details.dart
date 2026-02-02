import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/shared_components/shared_pages/error_page.dart';
import 'package:car_rental/core/shared_components/shared_pages/loading_page.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/book_now_widget.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/car_view_pager.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/date_details.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/distance_details.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/host_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarDetails extends StatelessWidget {
  String carId;
   CarDetails({super.key,required this.carId});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String id = args['id'];
    return BlocBuilder<CarDetailsCubit,CarDetailsState>(
  builder: (context, state) {
    if (state is CarDetailsLoading) {
      return LoadingPage(message: 'please wait  ',);
    }
    if (state is CarDetailsLoaded) {
      final carEntity = state.carDetailsEntity;
      return Scaffold(
        appBar: AppBar(
          leading: InkWell(child: Icon(Icons.arrow_back_ios),
              onTap: () {
                Navigator.pop(context);
              }),
          actions: [
            IconButton(onPressed: () {

            }, icon: Icon(Icons.favorite_outline_outlined))
          ],
          backgroundColor: ColorManager.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    //    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                      children: [
                        SizedBox(
                          height: 251.h,

                          child: CarViewPager(carEntity: carEntity),
                        ),

                       //  CarDetailsWidget( carEntity: carEntity,),
                        SizedBox(height: 20.h,),

                        HostDetails(hostEntity: carEntity.host!),
                        SizedBox(height: 20.h,),

                        DateDetails(),
                        SizedBox(height: 20.h,),
                        DistanceDetails(pickupLocations: [],)
                      ]

                  ),
                ),
              ),
            ),
            SizedBox(
                height: 91.h,
                child: BookNowWidget(originalPrice: 20, pricePerHour: 30,))
          ],
        ),
      );
    } else {
      return ErrorPage(message: 'error', onRetry: () {
        context.read<CarDetailsCubit>().getCarDetails(id);
      });
    }
  }
);
  }
}
