import 'package:car_rental/features/booking/presentation/view/pages/car_details.dart';
import 'package:car_rental/features/booking/presentation/view/pages/select_location.dart';
import 'package:car_rental/features/driver_information/presentation/pages/approved_page.dart';
import 'package:car_rental/features/driver_information/presentation/pages/driver_license_screen.dart';
import 'package:car_rental/features/driver_information/presentation/pages/mobile_number_screen.dart';
import 'package:car_rental/features/driver_information/presentation/pages/profile_photo_page.dart';
import 'package:car_rental/features/host/presentation/view/pages/host_car_details.dart';
import 'package:car_rental/features/host/presentation/view/pages/host_home_page.dart';
import 'package:car_rental/features/host/presentation/view/pages/host_profile.dart';
import 'package:car_rental/features/payment_process/view/pages/payment_options_page.dart';

import 'package:flutter/material.dart';

import 'package:car_rental/features/booking/presentation/view/pages/time_select.dart';
import 'package:car_rental/features/home/presentation/view/pages/home_page.dart';

class AppRouter {
  static const String homeRoute = '/';
  static const String carDetailsRoute = '/car_details';
  static const String selectTimeRoute = '/select_time';//
  static const String hostRoute = '/host';
  static const String selectLocationRoute = '/select_location';
  static const String paymentProcessRoute = '/payment_process';
  static const String paymentOptionsPage = '/payment_options_page';
  static const String approvedPage = '/approvedPage';
  static const String profilePhotoPage = '/profilePhotoPage';
  static const String mobileNumber = '/mobileNumber';
  static const String driverLicense = '/driverLicense';
  static const String hostCarDetails = '/hostCarDetails';
  static const String hostProfile = '/hostProfile';


 static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case carDetailsRoute:
      // You can pass arguments to the route like this:
      // final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => CarDetails());
      case selectTimeRoute:
        return MaterialPageRoute(builder: (_) => const SelectTime());
      case selectLocationRoute:
        return MaterialPageRoute(builder: (_) => const SelectLocation());
      case paymentOptionsPage:
        return MaterialPageRoute(builder: (_) => const PaymentOptionsPage());
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
        case mobileNumber:
      return MaterialPageRoute(builder: (_) => const MobileNumberScreen());

      default:
      // Handle unknown routes, perhaps navigate to a 404 page or home
        return MaterialPageRoute(builder: (_) =>
        const Center(
          child: Text('Route Not Found !!!'),
        ));
    }
  }
}