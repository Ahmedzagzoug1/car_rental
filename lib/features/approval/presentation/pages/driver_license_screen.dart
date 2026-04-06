import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/core/services/service_locators.dart';
import 'package:car_rental/core/shared_components/shared_widgets/custom_button.dart';
import 'package:car_rental/features/approval/domain/usecases/upload_image_to_ocr_usecase.dart';
import 'package:car_rental/features/approval/presentation/cubits/ocr_cubit/ocr_cubit.dart';
import 'package:car_rental/features/approval/presentation/widgets/license_form.dart';
import 'package:car_rental/features/approval/presentation/widgets/scan_license_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/image_source.dart';

class DriverLicenseScreen extends StatelessWidget {
  const DriverLicenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OcrCubit>(
      create: (context) => OcrCubit(sl<UploadImageToOcrUsecase>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Driver\'s License',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Enter License Details',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Please enter your info exactly as it appears on your license so EcoFlex can verify your eligibility to drive.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),
            const  ScanLicenseButton(),
              const SizedBox(height: 24),
                  LicenseForm(),
              const Spacer(),
              // Pushes the button to the bottom
              CustomButton(onPressed: () {
                Navigator.pushNamed(context, AppRouter.paymentOptionsPage);
              }, title: 'Save and Continue',),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

}