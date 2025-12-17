import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/features/driver_information/domain/usecases/send_otp_usecase.dart';
import 'package:car_rental/features/driver_information/domain/usecases/verify_otp_usecase.dart';
import 'package:car_rental/features/driver_information/presentation/cubits/otp_cubit/otp_cubit.dart';
import 'package:car_rental/features/driver_information/presentation/widgets/approval_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/service_locators.dart';

class ApprovedPage extends StatelessWidget {
  const ApprovedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> OtpCubit(sl<SendOtpUsecase>(), sl<VerifyOtpUsecase>()))
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              // Handle close action
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Get Approved to Drive',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Since this is your first trip, you’ll need to provide us with some information before you can check out.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                       ApprovalItem(
                        icon: Icons.person_outline,
                        title: 'Profile Photo',
                        subtitle:
                        'Your EcoFlex host will use it to identify you at pickup.',
                         onTap: (){
      Navigator.pushNamed(context, AppRouter.profilePhotoPage);
                         },
                      ),
                      const Divider(color: Colors.grey, height: 1),
                       ApprovalItem(
                        icon: Icons.phone_android_outlined,
                        title: 'Phone Number',
                        subtitle:
                        'We\'ll send you a verification code to help secure your account',
                         onTap: (){
                           Navigator.pushNamed(context, AppRouter.mobileNumber);
                         },
                      ),
                      const Divider(color: Colors.grey, height: 1),
                       ApprovalItem(
                        icon: Icons.credit_card_outlined,
                        title: 'Driver\'s License',
                        subtitle:
                        'You must have a valid driver\'s license to book on EcoFlex.',
                         onTap: (){
                           Navigator.pushNamed(context, AppRouter.driverLicense);
                         },
                      ),
                      const Divider(color: Colors.grey, height: 1),
                       ApprovalItem(
                        icon: Icons.payments_outlined,
                        title: 'Payment Method',
                        subtitle:
                        'You won\'t be charged until you book your trip.',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle continue action
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }


}