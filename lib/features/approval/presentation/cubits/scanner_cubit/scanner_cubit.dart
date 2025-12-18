import 'package:car_rental/features/approval/domain/usecases/get_from_gallery_usecase.dart';
import 'package:car_rental/features/approval/domain/usecases/scan_or_upload_from_camera_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

 part 'scanner_state.dart';
class ScannerCubit extends Cubit<ScannerState> {
final ScanFromGalleryUseCase scanFromGalleryUseCase;
final ScanOrUploadFromCameraUsecase scanOrUploadFromCameraUsecase;
  ScannerCubit(this.scanFromGalleryUseCase, this.scanOrUploadFromCameraUsecase) : super(ScannerInitial());


void onDetect(BarcodeCapture capture) async {
  if (state is ScannerLoading) return;

  final barcode = capture.barcodes.firstOrNull;
  final rawValue = barcode?.rawValue;

  if (rawValue == null) return;

  emit(ScannerLoading());

  try {
    final result = await scanOrUploadFromCameraUsecase.call(rawValue);
    emit(ScannerSuccess(result));
  } catch (e) {
    emit(ScannerError(e.toString()));
  }
}

  Future<void> scanFromGallery() async {
    emit(ScannerLoading());

    final result = await scanFromGalleryUseCase.call();

    result.fold(
          (failure) => emit(ScannerError(failure.message)),
          (qr) => emit(ScannerSuccess(qr!)),
    );
  }

}