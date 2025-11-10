import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_mode_state.dart';

class AppModeCubit extends Cubit<AppModeState> {
  AppModeCubit() : super(RenterMode());
  switchToHost()=>emit(HostMode());
  switchToRenter()=>emit(RenterMode());

}
