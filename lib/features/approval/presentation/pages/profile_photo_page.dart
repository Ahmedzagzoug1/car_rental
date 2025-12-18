import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/core/shared_components/shared_widgets/custom_button.dart';
import 'package:car_rental/features/approval/presentation/cubits/profile_image_cubit/profile_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/services/service_locators.dart';

class ProfilePhotoPage extends StatelessWidget {
  const ProfilePhotoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePicker=sl<ImagePicker>();

    return Scaffold(
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
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey[200],
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: Colors.grey[400],
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child:  BlocConsumer<ProfileImageCubit, ProfileImageState>(
                        listener: (context, state) {
                          if (state is ProfileImageFailure) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text(state.message)));
                          }
                        },
                        builder: (context, state) {
                          if (state is ProfileImageLoading) {
                            return CircularProgressIndicator();
                          } else if (state is ProfileImageloaded) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(state.image.url),
                                SizedBox(height: 10),
                                SelectableText(state.image.url),
                              ],
                            );
                          }
                          return GestureDetector(
                            onTap: () async {
                              final XFile? image =
                              await imagePicker.pickImage(
                                  source: ImageSource.gallery);
                              if (image != null) {
                                context.read<ProfileImageCubit>().uploadImage(
                                    image.path);
                              }
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 24,
                            ),
                          );
                        }
                  ),),
                ),
              ],
            ),
            const Spacer(), // Pushes the button to the bottom

            CustomButton(onPressed: (){
              //save data and push

              Navigator.pushNamed(context, AppRouter.paymentOptionsPage);
            },title: 'Save and Continue',),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}