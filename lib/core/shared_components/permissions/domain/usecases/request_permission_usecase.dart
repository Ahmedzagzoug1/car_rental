import 'package:car_rental/core/shared_components/permissions/domain/entities/app_permission.dart';
import 'package:car_rental/core/shared_components/permissions/domain/entities/app_permission_status.dart';
import 'package:car_rental/core/shared_components/permissions/domain/repositories/permission_repository.dart';

class RequestPermissionUseCase {
  final PermissionRepository repository;

  RequestPermissionUseCase(this.repository);

  Future<AppPermissionStatus> call(AppPermission permission) {
    return repository.request(permission);
  }
}

