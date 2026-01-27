import 'package:car_rental/features/approval/domain/usecases/get_from_gallery_usecase.dart';
import 'package:car_rental/features/approval/domain/usecases/recognize_text_from_image_usecase.dart';
import 'package:car_rental/features/approval/domain/usecases/scan_or_upload_from_camera_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 part 'scanner_state.dart';
class ScannerCubit extends Cubit<ScannerState> {
final ScanFromGalleryUseCase scanFromGalleryUseCase;
final ScanOrUploadFromCameraUsecase scanOrUploadFromCameraUsecase;
final RecognizeTextFromImageUseCase recognizeTextFromImageUseCase;
  ScannerCubit(this.scanFromGalleryUseCase, this.scanOrUploadFromCameraUsecase,
      this.recognizeTextFromImageUseCase) : super(ScannerInitial());


void onDetect( capture) async {
  /* if (state is ScannerLoading) return;

  final barcode = capture.barcodes.firstOrNull;
  final rawValue = barcode?.rawValue;

  if (rawValue == null) return;

  emit(ScannerLoading());

  try {
    final result = await scanOrUploadFromCameraUsecase.call(rawValue);
    emit(ScannerSuccess(result));
  } catch (e) {
    emit(ScannerError(e.toString()));
  }*/
}

  Future<void> scanFromGallery() async {
    emit(ScannerLoading());
String imagePath='';
    final imageResult = await scanFromGalleryUseCase.call();

    imageResult.fold(
          (failure) => emit(ScannerError(failure.message)),
          (imageSrc) {
            imagePath=imageSrc??'';
            emit(ScannerSuccess(imageSrc!));},
    );
    final textResult=await recognizeTextFromImageUseCase.call(imagePath);
    textResult.fold((failure)=>emit(ScannerError(failure.message)),
        (text) =>emit(ScannerSuccess(text)));
  }

}