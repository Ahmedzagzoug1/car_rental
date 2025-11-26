
import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class CarViewPager extends StatefulWidget {
  const CarViewPager({super.key });

  @override
  State<CarViewPager> createState() => _CarViewPagerState();
}

class _CarViewPagerState extends State<CarViewPager> {
  final PageController _pageController = PageController();


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

          return BlocBuilder<CarDetailsCubit, CarDetailsState>(
  builder: (context, state) {
    if(state is CarDetailsLoaded){
      CarDetailsEntity car=state.carDetailsEntity;
      return SizedBox(
        height: 251.h,
        child: Stack(
          children: [

            Positioned.fill(
              child: PageView.builder(
                controller: _pageController,
                itemCount: car.imagesUrl.length,
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: car.imagesUrl[index],
                    progressIndicatorBuilder: (context, url, progress) =>
                    const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  );
                },
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: AppSize.s20.h),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: car.imagesUrl.length,
                  effect:  WormEffect(
                      activeDotColor: ColorManager.green,
                      dotColor: ColorManager.white,
                      dotHeight: AppSize.s8.h,
                      dotWidth: AppSize.s8.w,
                      spacing: AppSize.s8.r,
                      ),
                ),
              ),
            ),

          ],
        ),
      );
  }

         else if (state is CarDetailsFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: Text('Unexpected error occurred'));
        }
      },
    );
  }
}
