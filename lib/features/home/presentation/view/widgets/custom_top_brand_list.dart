import 'package:car_rental/core/resources/value_manager.dart';

import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:car_rental/features/home/presentation/view/widgets/BrandWidget.dart';
import 'package:car_rental/features/home/presentation/view_model/brand_cubit/brand_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTopBrandList extends StatefulWidget {
  const CustomTopBrandList({super.key});

  @override
  State<CustomTopBrandList> createState() => _CustomTopBrandListState();
}

class _CustomTopBrandListState extends State<CustomTopBrandList> {
  @override
  void initState() {
    // TODO: implement initState

  }
  @override
  Widget build(BuildContext context) {
 return BlocProvider<BrandCubit>(
   create:   (context)=>BrandCubit()..getBrands(),
   child: BlocBuilder<BrandCubit,BrandState>(builder: (context,state){
     if(state is BrandInitial){
       return Text('start Loading data');
     }
else if(state is BrandLoading){
  return Center(child: CircularProgressIndicator());
}else if (state is BrandLoaded){
List<BrandEntity>brands=  context.read<BrandCubit>().brands;

  return SizedBox(
    height: AppSize.s96.sp,
    child: ListView.builder(itemCount: brands.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Brandwidget(
          brandEntity: brands[index],);
      },),);
}else{
  return Text('there is an error ');

   }}),);
}}


    /*FutureBuilder(
     future: context.read<BrandProvider>().fetchBrands(),
   //future: BrandRemoteDataSource().getBrands(),
     builder: (context, snapshot) {
       if (snapshot.connectionState == ConnectionState.waiting) {
         return CircularProgressIndicator();
       } else if (snapshot.connectionState == ConnectionState.done) {
         print('done-------------');
           return Consumer<BrandProvider>(builder: (context,brandProvider,child)
         {
           return SizedBox(
             height: AppSize.s96.sp,
             child: ListView.builder(itemCount: brandProvider.brands.length,
                 scrollDirection: Axis.horizontal,
                 itemBuilder: (context, index) {
                   return Brandwidget(
                     brandEntity: brandProvider.brands[index],);
                 },),);
         });*/
     /*  } else {
         return Text('else');
       }
     }
   );*/

/*
 Consumer<BrandProvider>(
      builder: (context, brandProvider, child) {
        switch (brandProvider.state) {
          case BrandState.initial:
         /*   WidgetsBinding.instance.addPostFrameCallback((_) {
              brandProvider.fetchBrands();
            });*/
            brandProvider.fetchBrands();

            return const Center(child: Text('Press the refresh button to load users.'));

          case BrandState.loading:
            return const Center(child: CircularProgressIndicator());
          case BrandState.loaded:

            return SizedBox(
              height: AppSize.s96.sp,
              child: ListView.builder(itemCount: brandProvider.brands.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return Brandwidget(brandEntity: brandProvider.brands[index],);
                  }),
            );


          case BrandState.error:
            return Center(child: Text('Error: ${brandProvider.errorMessage}'));
        }
      },
    );

  }
}
*/

