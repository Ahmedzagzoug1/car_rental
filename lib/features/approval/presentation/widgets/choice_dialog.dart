import 'package:car_rental/core/shared_components/permissions/domain/entities/app_permission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared_components/permissions/presentation/cubits/permission_cubit/permission_cubit.dart';
import '../../domain/entities/scan_source.dart';

class ChoiceDialog extends StatelessWidget {
  const ChoiceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Choose scan source'),
      content: BlocListener<PermissionCubit, PermissionState>(listener:  (context, state) {
        if (state is PermissionGranted) {
          Navigator.pop(context, ScanSource.camera);
        }

        if (state is PermissionDenied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Camera permission is required'),
            ),
          );
        }

        if (state is PermissionPermanentlyDenied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Camera permission permanently denied. Enable it from settings.',
              ),
            ),
          );
          context.read<PermissionCubit>().openAppSettingsUseCase();

        }
      }
          , child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () async {
                  context.read<PermissionCubit>().request(AppPermission.camera);
                }
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context, ScanSource.gallery);
                },
              ),
            ],
          )

      ),
    );
  }
}
