import 'package:car_rental/core/shared_components/permissions/domain/entities/app_permission.dart';
import 'package:car_rental/core/shared_components/permissions/presentation/cubits/permission_cubit/permission_cubit.dart';
import 'package:car_rental/features/approval/domain/entities/image_source.dart';
import 'package:car_rental/features/approval/presentation/cubits/ocr_cubit/ocr_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ScanLicenseButton extends StatelessWidget {
  const ScanLicenseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {

        ImageSource? imageSource=await  showImageSourceDialog(context);
        if(imageSource==ImageSource.gallery){
          context.read<OcrCubit>().uploadImageToOcr();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[100],
        ),
        child: const Row(
          children: [


            Icon(Icons.credit_card_outlined,
                color: Colors.green, size: 28),
            SizedBox(width: 16),
            Text(
              'Scan license to autofill',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
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
