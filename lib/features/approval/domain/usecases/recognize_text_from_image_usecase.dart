
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/approval_repository.dart';

class RecognizeTextFromImageUseCase {
  final ApprovalRepository repository;

  RecognizeTextFromImageUseCase(this.repository);

  Future<Either<Failure, String>> call(String imagePath) {
    return repository.recognizeTextFromImage(imagePath);
  }
}