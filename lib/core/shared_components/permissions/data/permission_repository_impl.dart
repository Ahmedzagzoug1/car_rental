import 'dart:io';

import 'package:car_rental/core/shared_components/permissions/domain/entities/app_permission_status.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../domain/entities/app_permission.dart';
import '../domain/repositories/permission_repository.dart';


class PermissionRepositoryImpl implements PermissionRepository {
  @override
  Future<AppPermissionStatus> request(AppPermission permission) async {
    final PermissionStatus status;

    switch (permission) {
      case AppPermission.camera:
        status = await Permission.camera.request();
        break;

      case AppPermission.storage:
        if (Platform.isAndroid) {
          final androidInfo = await DeviceInfoPlugin().androidInfo;

          // API 33 is Android 13
          if (androidInfo.version.sdkInt >= 33) {
            status = await Permission.photos.request();
          } else {
            status = await Permission.storage.request();
          }
        } else {
          //ios or others
          status = await Permission.storage.request();
        }
        break;
      case AppPermission.location:
        status = await Permission.location.request();

    }

    return _mapStatus(status);
  }

  @override
  Future<void> openSettings() async {
    await openAppSettings();
  }

  AppPermissionStatus _mapStatus(PermissionStatus status) {
    if (status.isGranted) {
      return AppPermissionStatus.granted;
    }

    if (status.isPermanentlyDenied) {
      return AppPermissionStatus.permanentlyDenied;
    }

    return AppPermissionStatus.denied;
  }
}

