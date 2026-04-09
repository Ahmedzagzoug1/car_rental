import 'package:car_rental/core/shared_components/permissions/domain/entities/app_permission.dart';
import 'package:car_rental/core/shared_components/permissions/domain/entities/app_permission_status.dart';

abstract class PermissionRepository {
  Future<AppPermissionStatus> request(AppPermission permission);
  Future<void> openSettings();
}
