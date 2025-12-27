import 'package:car_rental/core/services/service_locators.dart';

import 'package:car_rental/features/home/domain/entities/brand_entity.dart';
import 'package:car_rental/features/home/presentation/view/widgets/BrandWidget.dart';
import 'package:car_rental/features/home/presentation/cubit/brand_cubit/brand_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CustomTopBrandList extends StatelessWidget {
  const CustomTopBrandList({super.key});

  @override
  Widget build(BuildContext context) {
 return BlocProvider<BrandCubit>(
   create:   (context)=>sl<BrandCubit>()..getBrands(),
   child: BlocBuilder<BrandCubit,BrandState>(builder: (context,state){
     if(state is BrandInitial){
       return const Text('start Loading data');
     }
else if(state is BrandLoading){
  return const Center(child: CircularProgressIndicator());
}else if (state is BrandLoaded){
List<BrandEntity>brands=  state.brands;


    return  SizedBox(
      width: MediaQuery.of(context).size.width*.5,
      height: MediaQuery.of(context).size.height*.2,
      child: ListView.builder(itemCount: brands.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return BrandWidget(
            brandEntity: brands[index],);
        },),
    );
}else{
  return const Text('there is an error ');

   }}),);
}}

