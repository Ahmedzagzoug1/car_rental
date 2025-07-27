import 'package:car_rental/features/booking/presentation/view/pages/car_details.dart';
import 'package:car_rental/features/booking/presentation/view/pages/select_location.dart';
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
    /*  case hostRoute:
        return MaterialPageRoute(builder: (_) => const HostPage());*/

      default:
      // Handle unknown routes, perhaps navigate to a 404 page or home
        return MaterialPageRoute(builder: (_) =>
        const Center(
          child: Text('Route Not Found !!!'),
        ));
    }
  }
}