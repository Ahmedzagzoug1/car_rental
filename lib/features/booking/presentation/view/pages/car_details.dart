import 'package:car_rental/features/booking/presentation/cubit/booking_cubit/booking_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/car_information_widget.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/host_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/services/service_locators.dart';
import '../../../../host/presentation/view/pages/host_car_details.dart';
import '../../cubit/time_cubit/time_cubit.dart';
import '../widgets/book_now_widget.dart';
import '../widgets/car_view_pager.dart';
import '../widgets/date_details.dart';
import '../widgets/distance_details.dart';

class CarDetails extends StatefulWidget {
  const CarDetails({super.key});

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<TimeCubit>().getTime();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
    BlocProvider<TimeCubit>(
    create: (context) => sl<TimeCubit>(),),
    BlocProvider<BookingCubit>(
    create: (context) => sl<BookingCubit>(),)
    ], child: BlocProvider<TimeCubit>(
      create: (context) => sl<TimeCubit>(),

      child: Scaffold(
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
                      if(state is CarDetailsLoaded) {
                        return DistanceDetails(
                          pickupLocations: state.carDetailsEntity.pickupLocationEntities,);
                      }else{
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
      ),
    ));
  }
}
