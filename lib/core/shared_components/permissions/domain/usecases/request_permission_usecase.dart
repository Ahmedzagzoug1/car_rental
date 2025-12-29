import '../entities/app_permission_status.dart';
import '../repositories/permission_repository.dart';

class RequestCameraPermission {
  final PermissionRepository repo;
  RequestCameraPermission(this.repo);

  Future<AppPermissionStatus> call() {
    return repo.requestCamera();
  }
}
