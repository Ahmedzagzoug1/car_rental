import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/shared_components/permissions/domain/entities/app_permission.dart';
import 'package:car_rental/core/shared_components/permissions/presentation/cubits/permission_cubit/permission_cubit.dart';
import 'package:car_rental/features/approval/domain/entities/image_source.dart';
import 'package:car_rental/features/approval/presentation/cubits/profile_image_cubit/profile_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePhotoWidget extends StatelessWidget {
  const ProfilePhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //profile circle
        BlocBuilder<ProfileImageCubit, ProfileImageState>(

          builder: (context, state) {
            if (state is ProfileImageLoading) {
              return CircularProgressIndicator(color: ColorManager.primary,);
            } else if (state is ProfileImageloaded) {
              return Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child:(state.imageUrl == null || state.imageUrl.isEmpty) ?
                Icon(
                    Icons.person,
                    size: 80,

                    color: ColorManager.midGray
                ):
                CachedNetworkImage(

              imageUrl: state.imageUrl,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),

                  height: 80,

              ));
            } else {
              return Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                    Icons.person,
                    size: 80,

                    color: ColorManager.midGray
                ),
              );
            }
          }
        ),
        //add profile
        Positioned(
          bottom: 5,
          right: 5,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: ColorManager.green,
              shape: BoxShape.circle,
              border: Border.all(color: ColorManager.white, width: 2),
            ),
            child: GestureDetector(
              onTap: ()async {

              ImageSource? imageSource=await  showImageSourceDialog(context);
              if(imageSource==ImageSource.gallery){
                context.read<ProfileImageCubit>().uploadImage();
              }

              },
              child: Icon(
                Icons.add,
                color: ColorManager.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
  Future<ImageSource?> showImageSourceDialog(BuildContext context) {
    return showDialog<ImageSource>(
      context: context,
      builder: (context) {
        return BlocListener<PermissionCubit, PermissionState>(
          listener: (context, state) {
            if (state is PermissionGranted) {
              if (state.permission == AppPermission.camera) {
                Navigator.of(context).pop(ImageSource.camera);
              } else if (state.permission == AppPermission.storage) {
                Navigator.of(context).pop(ImageSource.gallery);
              }
            }

            if (state is PermissionDenied) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Permission is required'),
                ),
              );
            }

            if (state is PermissionPermanentlyDenied) {
              context.read<PermissionCubit>().openAppSettingsUseCase();
            }
          },
          child: AlertDialog(
            title: const Text('Choose scan source'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () {
                    context.read<PermissionCubit>().request(AppPermission.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo),
                  title: const Text('Gallery'),
                  onTap: () {
                    context.read<PermissionCubit>().request(AppPermission.storage);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
