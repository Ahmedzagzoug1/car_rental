part of 'permission_cubit.dart';

sealed class PermissionState extends Equatable {
  const PermissionState();
}

final class PermissionInitial extends PermissionState {
  @override
  List<Object> get props => [];
}
