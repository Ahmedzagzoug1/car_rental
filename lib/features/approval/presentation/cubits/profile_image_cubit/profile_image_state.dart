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
  final String imageUrl;
  const ProfileImageloaded(this.imageUrl);

  @override
  List<Object?> get props => [imageUrl];
}
class ProfileImageFailure extends ProfileImageState {
  final message;
  const ProfileImageFailure(this.message);
  @override
  List<Object?> get props => [message];
}
