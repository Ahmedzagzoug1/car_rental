import '../entities/app_permission.dart';
import '../entities/app_permission_status.dart';
import '../repositories/permission_repository.dart';

class RequestPermissionUseCase {
  final PermissionRepository repository;

  RequestPermissionUseCase(this.repository);

  Future<AppPermissionStatus> call(AppPermission permission) {
    return repository.request(permission);
  }
}

