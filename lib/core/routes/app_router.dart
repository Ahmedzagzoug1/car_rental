import 'package:car_rental/features/approval/presentation/pages/smart_qr_scanner.dart';
import 'package:car_rental/features/auth/presentation/pages/signin_page.dart';
import 'package:car_rental/features/auth/presentation/pages/signup_page.dart';
import 'package:car_rental/features/booking/domain/entities/pickup_location_entity.dart';
import 'package:car_rental/features/booking/domain/usecases/get_car_details.dart';
import 'package:car_rental/features/booking/domain/usecases/get_host_usecase.dart';
import 'package:car_rental/features/booking/domain/usecases/get_pickup_locations_usecase.dart';
import 'package:car_rental/features/booking/domain/usecases/get_user_location.dart';
import 'package:car_rental/features/booking/domain/usecases/save_pickup_location_usecase.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/host_cubit/host_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/location_cubit/location_cubit.dart';
import 'package:car_rental/features/booking/presentation/view/pages/booking_review_page.dart';
import 'package:car_rental/features/booking/presentation/view/pages/car_details.dart';
import 'package:car_rental/features/booking/presentation/view/pages/pickup_location_page.dart';
import 'package:car_rental/features/approval/presentation/pages/approved_page.dart';
import 'package:car_rental/features/approval/presentation/pages/driver_license_screen.dart';
import 'package:car_rental/features/approval/presentation/pages/otp_page.dart';
import 'package:car_rental/features/approval/presentation/pages/profile_photo_page.dart';
import 'package:car_rental/features/host/presentation/view/pages/host_car_details.dart';
import 'package:car_rental/features/host/presentation/view/pages/host_home_page.dart';
import 'package:car_rental/features/host/presentation/view/pages/host_profile.dart';
import 'package:car_rental/features/payment_process/presentation/view/pages/payment_options_page.dart';

import 'package:flutter/material.dart';

import 'package:car_rental/features/booking/presentation/view/pages/time_select.dart';
import 'package:car_rental/features/home/presentation/view/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/service_locators.dart';

class AppRouter {
  static const String homeRoute = '/';
  static const String signinWithEmailRoute = '/signinWithEmailRoute';
  static const String signupRoute = '/signupRoute';

  static const String carDetailsRoute = '/car_details';
  static const String selectTimeRoute = '/select_time';
  static const String selectLocationRoute = '/select_location';
  static const String  bookingReviewPage = '/booking_review_page';


  static const String paymentProcessRoute = '/payment_process';

  static const String paymentOptionsPage = '/payment_options_page';
  static const String approvedPage = '/approvedPage';
  static const String profilePhotoPage = '/profilePhotoPage';
  static const String otpPage = '/otpPage';
  static const String driverLicense = '/driverLicense';
  static const String smartQrScanner = '/smartQrScanner';

  static const String hostRoute = '/host';
  static const String hostCarDetails = '/hostCarDetails';
  static const String hostProfile = '/hostProfile';


  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case carDetailsRoute:
        return
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: context.read<CarDetailsCubit>(),
              child: CarDetails(),


          ),settings: settings,);

    /*  final args = settings.arguments ;

        if (args is Map<String, dynamic> && args.containsKey('id')) {
          final carId = args['id'];
          return MaterialPageRoute(
            builder: (context) {

              return MultiBlocProvider(  providers: [

                  BlocProvider(
                    create: (_) => CarDetailsCubit(sl<GetCarDetailsUseCase>())..loadCar(carId),
                  ),


                ],

              child: CarDetails(),);


            },
          );
        }

        return MaterialPageRoute(builder: (_) => Center(child: Text('there ia an expected error !'),));
*/

      case signinWithEmailRoute:
        return MaterialPageRoute(builder: (_) => const SigninPage());
      case signupRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case selectTimeRoute:
        return MaterialPageRoute(builder: (_) => const SelectTime());
      case selectLocationRoute:
        return MaterialPageRoute(builder: (_) => const PickUpLocationPage());


    /* final args = settings.arguments;

        if (args is Map<String, dynamic> &&
            args['pickupLocations'] is List<PickupLocationEntity>) {

          final pickupLocations = args['pickupLocations'] as List<PickupLocationEntity>;

          return MaterialPageRoute(
            builder: (context) {
              return BlocProvider<LocationCubit>(
                create: (_) => LocationCubit(
                  getUserLocationUseCase: sl<GetUserLocationUseCase>(),
                  getPickupLocationsUsecase: sl<GetPickupLocationsUsecase>(),
                  savePickupLocationUsecase: sl<SavePickupLocationUsecase>(),
                )..getLocations(pickupLocations),
                child: PickUpLocationPage(),
              );
            },
          );*/

      case  bookingReviewPage :
        return MaterialPageRoute(builder: (_)=>const BookingReviewPage());

      case paymentOptionsPage:
        return MaterialPageRoute(builder: (_) => const CheckoutPage());
      case hostRoute:
        return MaterialPageRoute(builder: (_) => const HostHomePage());
      case hostCarDetails:
        return MaterialPageRoute(builder: (_) => const HostCarDetails());
      case hostProfile:
        return MaterialPageRoute(builder: (_) => const HostProfile());
      case approvedPage:
        return MaterialPageRoute(builder: (_) => const ApprovedPage());
      case profilePhotoPage:
        return MaterialPageRoute(builder: (_) => const ProfilePhotoPage());
      case driverLicense:
        return MaterialPageRoute(builder: (_) => const DriverLicenseScreen());
      case otpPage:
        return MaterialPageRoute(builder: (_) => const OtpPage());
        case smartQrScanner:
      return MaterialPageRoute(builder: (_) => const SmartQrScanner());

      default:
      // Handle unknown routes, perhaps navigate to a 404 page or home
        return MaterialPageRoute(builder: (_) =>
        const Center(
          child: Text('Route Not Found !!!'),
        ));
    }
  }
}