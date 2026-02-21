import 'package:bloc/bloc.dart';
import 'package:car_rental/core/shared_components/permissions/domain/usecases/open_app_settings_usecase.dart';
import 'package:car_rental/core/shared_components/permissions/domain/usecases/request_permission_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/app_permission.dart';
import '../../../domain/entities/app_permission_status.dart';

part 'permission_state.dart';

class PermissionCubit extends Cubit<PermissionState> {
  final RequestPermissionUseCase requestPermissionUseCase;
  final OpenAppSettingsUseCase openAppSettingsUseCase;
  PermissionCubit(this.requestPermissionUseCase, this.openAppSettingsUseCase) : super(PermissionInitial());
  Future<void> request(AppPermission permission) async {
    emit(PermissionLoading());

    final status = await requestPermissionUseCase(permission);

    switch (status) {
      case AppPermissionStatus.granted:
        emit(PermissionGranted(permission: permission));
        break;

      case AppPermissionStatus.denied:
        emit(PermissionDenied());
        break;

      case AppPermissionStatus.permanentlyDenied:
        emit(PermissionPermanentlyDenied());
        break;
    }
  }
  Future<void> goToSettings() async {
    await openAppSettingsUseCase.call();
  }
}
