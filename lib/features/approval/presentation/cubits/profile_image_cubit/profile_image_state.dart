part of 'profile_image_cubit.dart';


sealed class ProfileImageState extends Equatable {
  const ProfileImageState();
}

final class ProfileImageInitial extends ProfileImageState {
  @override
  List<Object> get props => [];
}
class ProfileImageLoading extends ProfileImageState {
  @override
  List<Object?> get props =>[];
}
class ProfileImageloaded extends ProfileImageState {
  final image;
  ProfileImageloaded(this.image);

  @override
  List<Object?> get props => [image];
}
class ProfileImageFailure extends ProfileImageState {
  final message;
  ProfileImageFailure(this.message);
  @override
  List<Object?> get props => [message];
}
