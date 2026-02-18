import 'package:bloc/bloc.dart';
import 'package:car_rental/features/approval/domain/entities/license_entity.dart';
import 'package:car_rental/features/approval/domain/usecases/upload_image_to_ocr_usecase.dart';
import 'package:equatable/equatable.dart';

part 'ocr_state.dart';

class OcrCubit extends Cubit<OcrState> {
  final UploadImageToOcrUsecase uploadImageToOcrUsecase;
  OcrCubit(this.uploadImageToOcrUsecase) : super(OcrInitial());
  uploadImageToOcr()async{
    emit(OcrLoading());
  final ocr=await  uploadImageToOcrUsecase.call();
  ocr.fold(
          (failure)=>emit(OcrFailure(errMessage: failure.message)),
          (license)=>emit(OcrLoaded(licenseEntity: license)));
  }
}
