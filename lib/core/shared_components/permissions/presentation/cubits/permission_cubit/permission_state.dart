part of 'permission_cubit.dart';

sealed class PermissionState extends Equatable {
  const PermissionState();
}

final class PermissionInitial extends PermissionState {
  @override
  List<Object> get props => [];
}
class PermissionLoading extends PermissionState {
  @override
  List<Object> get props => [];
}

class PermissionGranted extends PermissionState {
  @override
List<Object> get props => [];}

class PermissionDenied extends PermissionState {
  @override
  List<Object> get props => [];
}

class PermissionPermanentlyDenied extends PermissionState {
  @override
  List<Object> get props => [];
}