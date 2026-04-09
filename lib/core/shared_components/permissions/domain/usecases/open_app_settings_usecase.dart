import 'package:car_rental/core/shared_components/permissions/domain/repositories/permission_repository.dart';

class OpenAppSettingsUseCase {
  final PermissionRepository repository;

  OpenAppSettingsUseCase(this.repository);

  Future<void> call() {
    return repository.openSettings();
  }
}
