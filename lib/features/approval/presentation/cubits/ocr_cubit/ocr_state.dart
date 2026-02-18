part of 'ocr_cubit.dart';

sealed class OcrState extends Equatable {
  const OcrState();
}

final class OcrInitial extends OcrState {
  @override
  List<Object> get props => [];
}
final class OcrLoading extends OcrState {
  @override
  List<Object> get props => [];
}
final class OcrLoaded extends OcrState {
 final LicenseEntity licenseEntity;

 const OcrLoaded({required this.licenseEntity});
  @override
  List<Object> get props => [];
}
final class OcrFailure extends OcrState {
  final String errMessage;

 const OcrFailure({required this.errMessage});
  @override
  List<Object> get props => [];
}
