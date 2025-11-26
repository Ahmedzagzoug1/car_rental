import 'package:car_rental/app/cubits/app_mode/app_mode_cubit.dart';
import 'package:car_rental/features/auth/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:car_rental/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:car_rental/features/auth/domain/repositories/auth_repository.dart';
import 'package:car_rental/features/auth/domain/usecases/email_auth/sign_in_with_email_usecase.dart';
import 'package:car_rental/features/auth/domain/usecases/email_auth/sign_up_with_email_usecase.dart';
import 'package:car_rental/features/auth/domain/usecases/phone_auth/sign_in_with_phone_usecase.dart';
import 'package:car_rental/features/auth/domain/usecases/phone_auth/verify_phone_code_usecase.dart';
import 'package:car_rental/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:car_rental/features/auth/domain/usecases/user/get_current_user.dart';
import 'package:car_rental/features/auth/domain/usecases/user/is_sign_in.dart';
import 'package:car_rental/features/auth/domain/usecases/user/save_user_data.dart';
import 'package:car_rental/features/auth/domain/usecases/user/upgrade_to_host.dart';
import 'package:car_rental/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:car_rental/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:car_rental/features/booking/data/data_source/local_data_source/car_details_local_data_source.dart' hide CarLocalDataSourceImpl;
import 'package:car_rental/features/booking/data/data_source/local_data_source/location_local_data_source.dart';
import 'package:car_rental/features/booking/data/data_source/remote_data_source/car_details_remote_data_source.dart';
import 'package:car_rental/features/booking/data/data_source/remote_data_source/create_booking_remote_data_source.dart';
import 'package:car_rental/features/booking/data/data_source/remote_data_source/location_remote_data_source.dart';
import 'package:car_rental/features/booking/data/data_source/local_data_source/time_local_data_source.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:car_rental/features/booking/data/model/time_model.dart';
import 'package:car_rental/features/booking/data/repositories/car_details_repository_impl.dart';
import 'package:car_rental/features/booking/data/repositories/create_booking_repository_implemention.dart';
import 'package:car_rental/features/booking/data/repositories/location_repository_impl.dart';
import 'package:car_rental/features/booking/data/repositories/time_repository_impl.dart';
import 'package:car_rental/features/booking/domain/repositories/booking_repository.dart';
import 'package:car_rental/features/booking/domain/repositories/car_details_repository.dart';
import 'package:car_rental/features/booking/domain/repositories/location_repository.dart';
import 'package:car_rental/features/booking/domain/repositories/time_repository.dart';
import 'package:car_rental/features/booking/domain/usecases/clear_time_usecase.dart';
import 'package:car_rental/features/booking/domain/usecases/get_car_details.dart';
import 'package:car_rental/features/booking/domain/usecases/get_host_usecase.dart';
import 'package:car_rental/features/booking/domain/usecases/get_pickup_locations_usecase.dart';
import 'package:car_rental/features/booking/domain/usecases/get_time_usecase.dart';
import 'package:car_rental/features/booking/domain/usecases/get_user_location.dart';
import 'package:car_rental/features/booking/domain/usecases/save_pickup_location_usecase.dart';
import 'package:car_rental/features/booking/domain/usecases/save_time_usecase.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/host_cubit/host_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/time_cubit/time_cubit.dart';
import 'package:car_rental/features/home/data/data_source/brand_data_source/brand_remote_data_source.dart';
import 'package:car_rental/features/home/data/data_source/cars_data_source/cars_local_data_source.dart';
import 'package:car_rental/features/home/data/data_source/cars_data_source/cars_remote_data_source.dart';
import 'package:car_rental/features/home/data/repositories/brand_repository_implement.dart';
import 'package:car_rental/features/home/data/repositories/cars_repository_implement.dart';
import 'package:car_rental/features/home/domain/repositories/brand_repository.dart';
import 'package:car_rental/features/home/domain/repositories/cars_repository.dart';
import 'package:car_rental/features/home/domain/usecases/get_brands_usecase.dart';
import 'package:car_rental/features/home/domain/usecases/get_cars_usecase.dart';
import 'package:car_rental/features/home/presentation/cubit/brand_cubit/brand_cubit.dart';
import 'package:car_rental/features/home/presentation/cubit/cars_home_cubit/cars_home_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

import '../../features/home/data/models/car_model.dart';

final  sl=GetIt.instance;
class ServicesLocators{
  init () async{

      //basic
      sl.registerLazySingleton<FirebaseFirestore>(()=> FirebaseFirestore.instance);
      sl.registerLazySingleton<FirebaseAuth>(()=> FirebaseAuth.instance);
      sl.registerLazySingleton<FlutterSecureStorage>(()=>FlutterSecureStorage());


//data layer
      // remote data source
      //auth
      sl.registerLazySingleton<AuthRemoteDataSource>(()=>AuthRemoteDataSourceImpl());

      //home
      sl.registerLazySingleton<BrandRemoteDataSource>(()=>BrandRemoteDataSource());
      sl.registerLazySingleton<CarsRemoteDataSource>(()=>CarsRemoteDataSource());

      //booking
      sl.registerLazySingleton<CreateBookingRemoteDataSource>(()=>CreateBookingRemoteDataSource());
      sl.registerLazySingleton<LocationRemoteDataSource>(()=>LocationRemoteDataSourceImpl());
      sl.registerLazySingleton<CarDetailsRemoteDataSource>(()=>CarDetailsRemoteDataSourceImpl());

      //local data source
        //home
       sl.registerLazySingleton<CarsLocalDataSource>(
            ()=>CarsLocalDataSourceImpl(carBox:  sl<Box<CarModel>>()));
       //booking
        sl.registerLazySingleton<CarDetailsLocalDataSource>(
                ()=>CarDetailsLocalDataSourceImpl( carBox: sl<Box<CarModel>>()));
        sl.registerLazySingleton<BookingTimeLocalDataSource>(
                ()=>BookingTimeLocalDataSourceImpl(box: sl<Box<TimeModel>>()));
      sl.registerLazySingleton<LocationLocalDataSource>(
              ()=>LocationLocalDataSourceImpl(box: sl<Box<PickupLocationModel>>()));


//repositories impl
    //auth
      sl.registerLazySingleton<AuthRepository>(()=>AuthRepositoryImpl(sl<AuthRemoteDataSource>()));


    //home
      sl.registerLazySingleton<BrandRepository>(
              () => BrandRepositoryImplement(brandRemoteDataSource:sl<BrandRemoteDataSource>()),
      );
      sl.registerLazySingleton<CarsRepository>(()=>CarsRepositoryImplement(carsRemoteDataSource:  sl<CarsRemoteDataSource>(),
          carsLocalDataSource: sl<CarsLocalDataSource>()));
      //booking
      sl.registerLazySingleton<CarDetailsRepository>(()=>CarDetailsRepositoryImpl(
      carDetailsRemoteDataSource: sl<CarDetailsRemoteDataSource>(),
      carDetailsLocalDataSource: sl<CarDetailsLocalDataSource>(),
      locationRemoteDataSource: sl<LocationRemoteDataSource>()));
      sl.registerLazySingleton<BookingRepository>(()=>BookingRepositoryImplementation(
          createBookingRemoteDataSource: sl<CreateBookingRemoteDataSource>()));
    sl.registerLazySingleton<LocationRepository>(()=>LocationRepositoryImpl(
        locationLocalDataSource: sl<LocationLocalDataSource>(),
    locationRemoteDataSource: sl<LocationRemoteDataSource>()));
      sl.registerLazySingleton<TimeRepository>(()=>BookingTimeRepositoryImpl(  sl<BookingTimeLocalDataSource>()));

//use cases
    //auth
      sl.registerLazySingleton<SignInWithEmailUsecase>(()=>SignInWithEmailUsecase(authRepository: sl<AuthRepository>()));
      sl.registerLazySingleton<SignUpWithEmailUseCase>(()=>SignUpWithEmailUseCase(authRepository: sl<AuthRepository>()));
      sl.registerLazySingleton<SignInWithPhoneUsecase>(()=>SignInWithPhoneUsecase(authRepository: sl<AuthRepository>()));
      sl.registerLazySingleton<VerifyPhoneCodeUsecase>(()=>VerifyPhoneCodeUsecase(authRepository: sl<AuthRepository>()));
      sl.registerLazySingleton<GetCurrentUser>(()=>GetCurrentUser(authRepository: sl<AuthRepository>()));
      sl.registerLazySingleton<IsSignIn>(()=>IsSignIn(authRepository: sl<AuthRepository>()));
      sl.registerLazySingleton<SaveUserData>(()=>SaveUserData(authRepository: sl<AuthRepository>()));
      sl.registerLazySingleton<UpgradeToHost>(()=>UpgradeToHost(authRepository: sl<AuthRepository>()));
      sl.registerLazySingleton<SignOutUsecase>(()=>SignOutUsecase(authRepository: sl<AuthRepository>()));


      sl.registerLazySingleton<GetBrandsUsecase>(()=>GetBrandsUsecase(sl<BrandRepository>()));
      sl.registerLazySingleton<GetCarsUsecase>(()=>GetCarsUsecase(sl<CarsRepository>()));
    //booking
      sl.registerLazySingleton<GetCarDetailsUseCase>(()=>GetCarDetailsUseCase(carDetailsRepository: sl<CarDetailsRepository>()));
      sl.registerLazySingleton<GetUserLocationUseCase>(()=>
          GetUserLocationUseCase(locationRepository: sl<LocationRepository>())
      );
      sl.registerLazySingleton<GetPickupLocationsUsecase>(()=>
          GetPickupLocationsUsecase(locationRepository: sl<LocationRepository>())
      );
      sl.registerLazySingleton<SavePickupLocationUsecase>(()=>
          SavePickupLocationUsecase(locationRepository: sl<LocationRepository>())
      );
      sl.registerLazySingleton<SaveTimeUsecase>(() => SaveTimeUsecase(timeRepository: sl<TimeRepository>()));
      sl.registerLazySingleton<GetTimeUsecase>(() => GetTimeUsecase(timeRepository: sl<TimeRepository>()));
      sl.registerLazySingleton<ClearTimeUsecase>(() => ClearTimeUsecase(timeRepository: sl<TimeRepository>()));
      sl.registerLazySingleton<GetHostUsecase>(()=>GetHostUsecase(carDetailsRepository: sl<CarDetailsRepository>()));




      //presentation layer
        //cubit
        sl.registerFactory<AppModeCubit>(()=>AppModeCubit());
        sl.registerFactory<CarsHomeCubit>(()=>CarsHomeCubit(getCarsUsecase: sl<GetCarsUsecase>()));
        sl.registerFactory<BrandCubit>(()=>BrandCubit());
    sl.registerFactory<CarDetailsCubit>(()=>CarDetailsCubit(sl<GetCarDetailsUseCase>()));
    sl.registerFactory<HostCubit>(()=>HostCubit(sl<GetHostUsecase>()));
        sl.registerFactory<LocationCubit>(()=>LocationCubit(getPickupLocationsUsecase: sl<GetPickupLocationsUsecase>(),
        getUserLocationUseCase: sl<GetUserLocationUseCase>(),savePickupLocationUsecase: sl<SavePickupLocationUsecase>()));
        sl.registerFactory<TimeCubit>(()=>TimeCubit(sl<GetTimeUsecase>(),
        sl<SaveTimeUsecase>()));
        sl.registerFactory<SigninCubit>(()=>SigninCubit(sl<SignInWithEmailUsecase>()));
        sl.registerFactory<SignupCubit>(()=>SignupCubit(sl<SignUpWithEmailUseCase>()));


  }
}