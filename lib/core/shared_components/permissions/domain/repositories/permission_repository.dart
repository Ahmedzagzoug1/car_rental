import '../entities/app_permission.dart';
import '../entities/app_permission_status.dart';

abstract class PermissionRepository {
  Future<AppPermissionStatus> request(AppPermission permission);
  Future<void> openSettings();
}
