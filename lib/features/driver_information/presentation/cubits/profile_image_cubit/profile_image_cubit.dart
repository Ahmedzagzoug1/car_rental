import 'package:bloc/bloc.dart';
import 'package:car_rental/features/driver_information/domain/usecases/upload_profile_photo_usecase.dart';
import 'package:equatable/equatable.dart';

part 'profile_image_state.dart';

class ImageCubit extends Cubit<ProfileImageState> {
  //TODO cubit Getit
  final UploadProfilePhotoUsecase uploadProfilePhotoUsecase;

  ImageCubit({required this.uploadProfilePhotoUsecase}) : super(ProfileImageInitial());

  Future<void> uploadImage(String filePath) async {
    try {
      emit(ImageLoading());
      final uploadImage = await uploadProfilePhotoUsecase(filePath);
      uploadImage.fold((failure)=>emit(P), (sucess))
      emit(ImageUploaded(image));
    } catch (e) {
      emit(ImageError(e.toString()));
    }
  }
}
