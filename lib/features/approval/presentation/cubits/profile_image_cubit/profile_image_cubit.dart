import 'package:bloc/bloc.dart';
import 'package:car_rental/features/approval/domain/usecases/upload_profile_photo_usecase.dart';
import 'package:equatable/equatable.dart';

part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  final UploadProfilePhotoUsecase uploadProfilePhotoUsecase;

  ProfileImageCubit({required this.uploadProfilePhotoUsecase}) : super(ProfileImageInitial());

  Future<void> uploadImage() async {
    try {
      emit(ProfileImageLoading());
      final uploadImage = await uploadProfilePhotoUsecase();
      uploadImage.fold((failure)=>emit(ProfileImageFailure(failure)),
          (imageUrl)=>emit(ProfileImageloaded(imageUrl)));
    } catch (e) {
      emit(ProfileImageFailure(e.toString()));
    }
  }
}
