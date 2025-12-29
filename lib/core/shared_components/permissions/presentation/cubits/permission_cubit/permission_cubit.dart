import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'permission_state.dart';

class PermissionCubit extends Cubit<PermissionState> {
  PermissionCubit() : super(PermissionInitial());
}
