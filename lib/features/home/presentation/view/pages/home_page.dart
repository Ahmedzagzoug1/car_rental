import 'package:car_rental/core/resources/assets_manager.dart';
import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/core/services/service_locators.dart';
import 'package:car_rental/features/home/data/data_source/brand_data_source/brand_remote_data_source.dart';
import 'package:car_rental/features/home/data/data_source/cars_data_source/cars_remote_data_source.dart';
import 'package:car_rental/features/home/data/repositories/brand_repository_implement.dart';
import 'package:car_rental/features/home/data/repositories/cars_repository_implement.dart';
import 'package:car_rental/features/home/domain/usecases/get_brands_usecase.dart';
import 'package:car_rental/features/home/domain/usecases/get_cars_usecase.dart';
import 'package:car_rental/features/home/presentation/view/widgets/custom_appbar.dart';
import 'package:car_rental/features/home/presentation/view/widgets/custom_cars_listview.dart';
import 'package:car_rental/features/home/presentation/view/widgets/custom_top_brand_list.dart';
import 'package:car_rental/features/home/presentation/cubit/cars_home_cubit/cars_home_cubit.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: BlocProvider<CarsHomeCubit>(
        create: (context) => sl()..getCars(),

        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: ColorManager.green,
            child: Image.asset(ImageAssets.floatingIcon, color: ColorManager.white),
            onPressed: () => _onItemTapped(2),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            color: Colors.black,
            shape: const CircularNotchedRectangle(),
            notchMargin: 8,
            child: RPadding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side icons
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset(ImageAssets.messageIcon, color: ColorManager.white),
                        onPressed: () => _onItemTapped(0),
                      ),
                      IconButton(
                        icon: Image.asset(ImageAssets.tripIcon, color: ColorManager.white),
                        onPressed: () => _onItemTapped(1),
                      ),
                    ],
                  ),
                  // Right side icons
                  Row(
                    children: [
                      IconButton(
                        icon:  Icon(Icons.favorite_border, color: ColorManager.white),
                        onPressed: () => _onItemTapped(3),
                      ),
                      IconButton(
                        icon:  Icon(Icons.person_outline, color: ColorManager.white),
                        onPressed: () => _onItemTapped(4),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),


          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomScrollView(
              slivers: [
                // AppBar
                const SliverToBoxAdapter(child: CustomAppbar()),
                SliverToBoxAdapter(child: AppSize.s14.verticalSpace),

                // Title + Button
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rent a Car anytime',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: const Text('Host & Earn'),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(child: AppSize.s14.verticalSpace),

                // Search Field
                SliverToBoxAdapter(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: ColorManager.inputBackgroundColor,
                      filled: true,
                      hintText: 'Search any car...',
                      prefixIcon: const Icon(Icons.search_rounded),
                      suffixIcon: const Icon(CupertinoIcons.arrow_down),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: AppSize.s14.verticalSpace),

                // Top Brands Header
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Top Brands',
                          style: Theme.of(context).textTheme.headlineLarge),
                      Text('View all',
                          style: Theme.of(context).textTheme.displayMedium),
                    ],
                  ),
                ),
                SliverToBoxAdapter(child: AppSize.s14.verticalSpace),

                // CustomTopBrandList
                const SliverToBoxAdapter(child: CustomTopBrandList()),
                SliverToBoxAdapter(child: AppSize.s14.verticalSpace),

                // Top Rated Cars Header
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Top Rated Cars',
                          style: Theme.of(context).textTheme.headlineLarge),
                      Text('View all',
                          style: Theme.of(context).textTheme.displayMedium),
                    ],
                  ),
                ),
                SliverToBoxAdapter(child: AppSize.s14.verticalSpace),

                const SliverToBoxAdapter(child: CustomCarsListview()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
