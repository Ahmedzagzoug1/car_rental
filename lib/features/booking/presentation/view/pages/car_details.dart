import 'package:car_rental/features/booking/domain/usecases/get_car_details.dart';
import 'package:car_rental/features/booking/presentation/cubit/booking_cubit/booking_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/car_information_widget.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/host_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/services/service_locators.dart';
import '../../../../host/presentation/view/pages/host_car_details.dart';
import '../../../domain/usecases/get_host_usecase.dart';
import '../../cubit/host_cubit/host_cubit.dart';
import '../../cubit/time_cubit/time_cubit.dart';
import '../widgets/book_now_widget.dart';
import '../widgets/car_view_pager.dart';
import '../widgets/date_details.dart';
import '../widgets/distance_details.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context));

    final args = ModalRoute
        .of(context)!
        .settings
        .arguments;
    if (args is Map<String, dynamic>) {
      final carId = args['id'];
      print('${carId} deteils');
      context.read<HostCubit>().getHost(carId);
      context.read<LocationCubit>().getLocations(carId);
      context.read<CarDetailsCubit>().getCarDetails(carId);


      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline_outlined),
                ),

              ],
              leading: InkWell(
                child: const Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: ColorManager.white,
              elevation: 0,

            ),
            SliverPadding(
              padding: EdgeInsets.all(8.0.r),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  RSizedBox(
                    height: 251,
                    child: CarViewPager(),
                  ),
                  RSizedBox(height: 8),
                  CarInformationWidget(),
                  RSizedBox(height: 8),

                  HostDetails(),
                  DateDetails(),
                  RSizedBox(height: 8),
                  BlocBuilder<CarDetailsCubit, CarDetailsState>(
                    builder: (context, state) {
                      if (state is CarDetailsLoaded) {
                        return DistanceDetails(
                          pickupLocations: state.carDetailsEntity
                              .pickupLocationEntities,);
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ]),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: 91.h,
          child: BookNowWidget(
            originalPrice: 20,
            pricePerHour: 30,

          ),
        ),

      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }
}
