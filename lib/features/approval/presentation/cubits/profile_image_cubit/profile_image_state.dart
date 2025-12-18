part of 'profile_image_cubit.dart';


sealed class ProfileImageState extends Equatable {
  const ProfileImageState();
}

final class ProfileImageInitial extends ProfileImageState {
  @override
  List<Object> get props => [];
}
class ImageLoading extends ProfileImageState {
  @override
  List<Object?> get props =>[];
}
class ImageUploaded extends ProfileImageState {
  final image;
  ImageUploaded(this.image);

  @override
  List<Object?> get props => [image];
}
class ImageError extends ProfileImageState {
  final message;
  ImageError(this.message);
  @override
  List<Object?> get props => [message];
}
