import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/core/shared_components/shared_widgets/custom_button.dart';
import 'package:car_rental/features/approval/domain/usecases/upload_profile_photo_usecase.dart';
import 'package:car_rental/features/approval/presentation/cubits/profile_image_cubit/profile_image_cubit.dart';
import 'package:car_rental/features/approval/presentation/widgets/profile_photo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/services/service_locators.dart';

class ProfilePhotoPage extends StatelessWidget {
  const ProfilePhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileImageCubit>(
      create: (context) =>
          sl<ProfileImageCubit>(),
      child: SafeArea(

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
            title: const Text(
              'Profile Photo',
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Choose Profile Photo',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Please provide a clear photo of your face so your hosts can recognize you.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                // Profile Photo Circle
                const ProfilePhotoWidget(),


                const SizedBox(height: 24),
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: CustomButton(onPressed: () {
              //save data and push

              Navigator.pushNamed(context, AppRouter.paymentOptionsPage);
            }, title: 'Save and Continue',),
          ) ,
        ),
      ),
    );
  }

}