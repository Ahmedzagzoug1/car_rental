import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/core/services/service_locators.dart';

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
   create:   (context)=>sl<BrandCubit>()..getBrands(),
   child: BlocBuilder<BrandCubit,BrandState>(builder: (context,state){
     if(state is BrandInitial){
       return Text('start Loading data');
     }
else if(state is BrandLoading){
  return Center(child: CircularProgressIndicator());
}else if (state is BrandLoaded){
List<BrandEntity>brands=  state.brands;


    return  SizedBox(
      width: MediaQuery.of(context).size.width*.8,
      height: MediaQuery.of(context).size.height*.3,
      child: ListView.builder(itemCount: brands.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Brandwidget(
            brandEntity: brands[index],);
        },),
    );
}else{
  return Text('there is an error ');

   }}),);
}}

