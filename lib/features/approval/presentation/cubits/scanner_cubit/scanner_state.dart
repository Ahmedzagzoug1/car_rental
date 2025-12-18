part of 'scanner_cubit.dart';
abstract class ScannerState {}

class ScannerInitial extends ScannerState {}

class ScannerLoading extends ScannerState {}

class ScannerSuccess extends ScannerState {
  final String result;
  ScannerSuccess(this.result);
}

class ScannerError extends ScannerState {
  final String message;
  ScannerError(this.message);
}

class TorchStateUpdated extends ScannerState {
  final bool isTorchOn;
  TorchStateUpdated(this.isTorchOn);
}