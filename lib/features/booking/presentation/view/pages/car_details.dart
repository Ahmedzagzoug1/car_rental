import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/services/service_locators.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/time_cubit/time_cubit.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/book_now_widget.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/car_details_widget.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/car_view_pager.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/date_details.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/distance_details.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/host_details.dart';
import 'package:car_rental/features/home/presentation/view/pages/home_page.dart';
import 'package:car_rental/features/home/presentation/view_model/cars_home_cubit/cars_home_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../data/model/time_model.dart';

class CarDetails extends StatefulWidget {
//final String carId;
  CarDetails({super.key});

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  @override
  void initState() {
    context.read<TimeCubit>().getTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimeCubit>(
      create: (context) => sl<TimeCubit>(),
      child: Scaffold(

        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_outline_outlined),
                ),
              ],
              leading: InkWell(
                child: Icon(Icons.arrow_back_ios),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: ColorManager.white,
              elevation: 0,
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverList(
                  delegate:
                  SliverChildListDelegate([

                    SizedBox(
                        height: 251.h,
                        child: CarViewPager()),


                    SizedBox(height: 20.h),
                    DateDetails(),
                    SizedBox(height: 20.h),
                    DistanceDetails(),
                    SizedBox(height: 100.h),
                  ])

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
    );
  }
}
