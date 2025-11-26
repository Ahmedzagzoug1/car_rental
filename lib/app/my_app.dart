
import 'package:car_rental/app/cubits/app_mode/app_mode_cubit.dart';
import 'package:car_rental/core/services/service_locators.dart';
import 'package:car_rental/core/utils/permissions.dart';
import 'package:car_rental/features/booking/domain/usecases/get_host_usecase.dart';
import 'package:car_rental/features/booking/presentation/cubit/host_cubit/host_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/time_cubit/time_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/resources/theme_manager.dart';
import '../core/routes/app_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
  super.initState();
  getUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) =>


           MultiBlocProvider(
             providers: [
               BlocProvider<AppModeCubit>(create: (context)=>sl<AppModeCubit>()),
               BlocProvider<TimeCubit>(create: (context)=>sl<TimeCubit>()),
               BlocProvider<LocationCubit>(create: (context)=>sl<LocationCubit>()),

             ],
             child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: getApplicationTheme(),
            //  home: MyTest(),
               initialRoute:AppRouter.homeRoute,
                onGenerateRoute: AppRouter.onGenerateRoute,
              ),
           ));
  }
}
class MyTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HostCubit>(create: (_)=> HostCubit(sl<GetHostUsecase>())..getHost('asd'),
      child: Scaffold(
        body: BlocBuilder<HostCubit,HostState>(builder: (context,state) {
          if (state is HostLoaded){
            return Center(child: Text(state.hostEntity.name));

        } else {
            return Text('error');
          }
  }),
      ),

    ) ;
  }

}

