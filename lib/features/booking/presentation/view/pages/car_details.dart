import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/services/service_locators.dart';

import 'package:car_rental/features/booking/presentation/cubit/time_cubit/time_cubit.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/book_now_widget.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/car_view_pager.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/date_details.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/distance_details.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CarDetails extends StatefulWidget {
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
              padding:  EdgeInsets.all(16.0.r),
              sliver: SliverList(
                  delegate:
                  SliverChildListDelegate([

                 const   RSizedBox(
                        height: 251,
                        child: CarViewPager()),


                  const  RSizedBox(height: 20),
                 const   DateDetails(),
                    const  RSizedBox(height: 20),
                    DistanceDetails(),
                    const  RSizedBox(height: 20),
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
