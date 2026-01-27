part of 'app_mode_cubit.dart';

@immutable
sealed class AppModeState {}

class HostMode extends AppModeState{}
class RenterMode extends AppModeState{}

