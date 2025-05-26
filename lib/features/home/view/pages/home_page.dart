import 'package:car_rental/features/home/view/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  RPadding(
        padding: EdgeInsets.all(8.0),
        child: Scaffold(
          body: Column(
            children: [
              CustomAppbar()
            ],
          ),
        ),
      ),
    );
  }
}
