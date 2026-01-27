part of 'host_cubit.dart';

sealed class HostState extends Equatable {
  const HostState();
}

final class HostInitial extends HostState {
  @override
  List<Object> get props => [];
}
final class HostLoading extends HostState {
  @override
  List<Object?> get props => [];

}
  final class HostLoaded extends HostState {
  final HostEntity hostEntity;

  const HostLoaded({required this.hostEntity});
  @override
  // TODO: implement props
  List<Object?> get props => [hostEntity];

  }
  final class HostFailure extends HostState {
final String errMessage;

  const HostFailure({required this.errMessage});

  @override
  // TODO: implement props
  List<Object?> get props =>[errMessage];

}
