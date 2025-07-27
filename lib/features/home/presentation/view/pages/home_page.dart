import 'package:car_rental/core/resources/assets_manager.dart';
import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/features/home/presentation/view/widgets/custom_appbar.dart';
import 'package:car_rental/features/home/presentation/view/widgets/custom_cars_listview.dart';
import 'package:car_rental/features/home/presentation/view/widgets/custom_top_brand_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Image.asset(ImageAssets.floatingIcon, color: Colors.white), // Leaf icon
          onPressed: () => _onItemTapped(2),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left side icons
                Row(
                  children: [
                    IconButton(
                      icon: Image.asset(ImageAssets.messageIcon, color: Colors.white),
                      onPressed: () => _onItemTapped(0),
                    ),
                    IconButton(
                      icon: Image.asset(ImageAssets.tripIcon, color: Colors.white),
                      onPressed: () => _onItemTapped(1),
                    ),
                  ],
                ),
                // Right side icons
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border, color: Colors.white),
                      onPressed: () => _onItemTapped(3),
                    ),
                    IconButton(
                      icon: Icon(Icons.person_outline, color: Colors.white),
                      onPressed: () => _onItemTapped(4),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const  CustomAppbar(),
                AppSize.s14.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Rent a Car anytime',style: Theme.of(context).textTheme.headlineLarge,),
                    ElevatedButton(onPressed: (){

                    },

                      style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text('Host & Earn' ,),
                    ),

                  ],
                ),
                AppSize.s14.verticalSpace,

                //text field

                   TextField(

                  decoration: InputDecoration(
                      fillColor: ColorManager.inputBackgroundColor,
            filled: true,
                      hintText: 'Search any car...',

                      prefixIcon:Icon(Icons.search_rounded) ,
                      suffixIcon: Icon(CupertinoIcons.arrow_down)
                  ),
                ),
                AppSize.s14.verticalSpace,
                //Top Brands

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Top Brands',style:Theme.of(context).textTheme.headlineLarge ,),
                    Text('View all',style:Theme.of(context).textTheme.displayMedium ,),

                  ],
                ),
                AppSize.s14.verticalSpace,
             const CustomTopBrandList(),
                AppSize.s14.verticalSpace,
            //Top Rated Cars
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Top Rated Cars',style:Theme.of(context).textTheme.headlineLarge ,),
                    Text('View all',style:Theme.of(context).textTheme.displayMedium ,),

                  ],
                ),
                AppSize.s14.verticalSpace,
                const CustomCarsListview()

              ],
            ),
          ),
        ),
      ),
    );
  }
}
