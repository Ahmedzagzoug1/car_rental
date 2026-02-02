import 'package:car_rental/features/auth/presentation/pages/signin_page.dart';
import 'package:car_rental/features/auth/presentation/pages/signup_page.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
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

import 'package:car_rental/features/home/presentation/view/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/booking/presentation/view/pages/selected_time.dart';


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
        return MaterialPageRoute(builder: (_) => const HomePage());
      case carDetailsRoute:
      // 1. استخرج الـ arguments وحولها لـ Map
        final args = settings.arguments as Map<String, dynamic>;
        // 2. اسحب الـ id من الـ Map
        final carId = args['id'];

        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: context.read<CarDetailsCubit>()..getCarDetails(carId),
            child: CarDetails(carId: carId),
          ),
          settings: settings,
        );


      case signinWithEmailRoute:
        return MaterialPageRoute(builder: (_) => const SigninPage());
      case signupRoute:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case selectTimeRoute:
        return MaterialPageRoute(builder: (_) => const SelectTime());
      case selectLocationRoute:
        return MaterialPageRoute(builder: (_) => const PickUpLocationPage());


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
      default:
        return MaterialPageRoute(builder: (_) =>
     const   Scaffold(
          body:  Center(
            child: Text('Route Not Found !!!'),
          ),
        ));
    }
  }
}