import 'package:car_rental/features/booking/data/data_source/remote_data_source/car_details_remote_data_source.dart';
import 'package:car_rental/features/booking/data/data_source/remote_data_source/create_booking_remote_data_source.dart';
import 'package:car_rental/features/booking/data/data_source/remote_data_source/map_remote_data_source.dart';
import 'package:car_rental/features/booking/data/data_source/remote_data_source/time_local_data_source.dart';
import 'package:car_rental/features/booking/data/model/time_model.dart';
import 'package:car_rental/features/booking/data/repositories/create_booking_repository_implemention.dart';
import 'package:car_rental/features/booking/data/repositories/time_repository_impl.dart';
import 'package:car_rental/features/booking/domain/repositories/booking_repository.dart';
import 'package:car_rental/features/booking/domain/repositories/time_repository.dart';
import 'package:car_rental/features/booking/domain/usecases/clear_time_usecase.dart';
import 'package:car_rental/features/booking/domain/usecases/get_car_details.dart';
import 'package:car_rental/features/booking/domain/usecases/get_time_usecase.dart';
import 'package:car_rental/features/booking/domain/usecases/get_user_location.dart';
import 'package:car_rental/features/booking/domain/usecases/save_time_usecase.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/time_cubit/time_cubit.dart';
import 'package:car_rental/features/home/data/data_source/brand_data_source/brand_remote_data_source.dart';
import 'package:car_rental/features/home/data/data_source/cars_data_source/car_remote_data_source.dart';
import 'package:car_rental/features/home/data/repositories/brand_repository_implement.dart';
import 'package:car_rental/features/home/data/repositories/cars_repository_implement.dart';
import 'package:car_rental/features/home/domain/repositories/brand_repository.dart';
import 'package:car_rental/features/home/domain/repositories/cars_repository.dart';
import 'package:car_rental/features/home/domain/usecases/get_brands_usecase.dart';
import 'package:car_rental/features/home/domain/usecases/get_cars_usecase.dart';
import 'package:car_rental/features/home/presentation/view_model/brand_cubit/brand_cubit.dart';
import 'package:car_rental/features/home/presentation/view_model/cars_home_cubit/cars_home_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

final  sl=GetIt.instance;
class ServicesLocators{
  init () async{
    //presentation layer
//cubit
sl.registerFactory<CarsHomeCubit>(()=>CarsHomeCubit());
sl.registerFactory<BrandCubit>(()=>BrandCubit());
sl.registerFactory<CarDetailsCubit>(()=>CarDetailsCubit());
sl.registerFactory<LocationCubit>(()=>LocationCubit(sl<GetUserLocationUseCase>()));
sl.registerFactory<TimeCubit>(()=>TimeCubit(sl<GetTimeUsecase>(),
sl<SaveTimeUsecase>()));

//domain layer

//use cases
sl.registerLazySingleton<GetBrandsUsecase>(()=>GetBrandsUsecase(sl()));
sl.registerLazySingleton<GetCarsUsecase>(()=>GetCarsUsecase(sl()));
sl.registerLazySingleton<GetCarDetailsUseCase>(()=>GetCarDetailsUseCase(bookingRepository: sl()));
    sl.registerLazySingleton<GetUserLocationUseCase>(()=>
        GetUserLocationUseCase(bookingRepository:sl<BookingRepository>()));
    sl.registerLazySingleton<SaveTimeUsecase>(() => SaveTimeUsecase(timeRepository: sl<TimeRepository>()));
    sl.registerLazySingleton<GetTimeUsecase>(() => GetTimeUsecase(timeRepository: sl<TimeRepository>()));
    sl.registerLazySingleton<ClearTimeUsecase>(() => ClearTimeUsecase(timeRepository: sl<TimeRepository>()));


//data layer
//repositories impl
    sl.registerLazySingleton<BrandRepository>(
          () => BrandRepositoryImplement(brandRemoteDataSource:sl()),
    ); 
    sl.registerLazySingleton<CarsRepository>(()=>CarsRepositoryImplement(carRemoteDataSource:  sl()));
    sl.registerLazySingleton<BookingRepository>(()=>BookingRepositoryImplementation(createBookingRemoteDataSource: sl(),
        carDetailsRemoteDataSource: sl(),
    mapRemoteDataSource: sl()));
    sl.registerLazySingleton<TimeRepository>(()=>BookingTimeRepositoryImpl(  sl<BookingTimeLocalDataSource>()));

    //data source
      //home
          sl.registerLazySingleton<BrandRemoteDataSource>(()=>BrandRemoteDataSource());
          sl.registerLazySingleton<CarRemoteDataSource>(()=>CarRemoteDataSource());
      //booking
          sl.registerLazySingleton<CarDetailsRemoteDataSource>(()=>CarDetailsRemoteDataSource());
          sl.registerLazySingleton<CreateBookingRemoteDataSource>(()=>CreateBookingRemoteDataSource());
    sl.registerLazySingleton<MapRemoteDataSource>(()=>MapRemoteDataSource());
    sl.registerLazySingleton<BookingTimeLocalDataSource>(
            ()=>BookingTimeLocalDataSourceImpl(box: sl<Box<TimeModel>>()));

    //other
    sl.registerLazySingleton<FirebaseFirestore>(()=> FirebaseFirestore.instance);
  }
}