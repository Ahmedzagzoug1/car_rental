import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/core/shared_components/shared_widgets/custom_button.dart';
import 'package:car_rental/features/approval/domain/usecases/send_otp_usecase.dart';
import 'package:car_rental/features/approval/domain/usecases/verify_otp_usecase.dart';
import 'package:car_rental/features/approval/presentation/cubits/otp_cubit/otp_cubit.dart';
import 'package:car_rental/features/approval/presentation/widgets/approval_item.dart';
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
Navigator.pop(context) ;
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
               Text(
                'Since this is your first trip, you’ll need to provide us with some information before you can check out.',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: ColorManager.charcoalBlack05),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: ColorManager.green100,
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
                             Navigator.pushNamed(context, AppRouter.otpPage);
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
                           onTap: (){
                             Navigator.pushNamed(context, AppRouter.paymentOptionsPage);
                           },

                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(title: 'Continue',onPressed: (){
                Navigator.pushNamed(context, AppRouter.profilePhotoPage);
              },),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }


}