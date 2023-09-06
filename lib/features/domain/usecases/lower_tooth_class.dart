import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/caries.dart';
import '../repositories/repository.dart';

class CreateLowerImageClassification {
  final Repository repository;

  CreateLowerImageClassification(this.repository);

  Future<Either<Failure, Caries>> execute(String image) {
    return repository.lowerImageClassification(image);
  }
}

class LowerImageResponse {
  final Repository repository;

  LowerImageResponse(this.repository);

  Future<Either<Failure, Uint8List>> execute(String image) {
    return repository.imgLowerResponse(image);
  }
}
