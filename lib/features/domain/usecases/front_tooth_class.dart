import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/caries.dart';
import '../repositories/repository.dart';

class CreateFrontImageClassification {
  final Repository repository;

  CreateFrontImageClassification(this.repository);

  Future<Either<Failure, Caries>> execute(String image) {
    return repository.frontImageClassification(image);
  }
}

class FrontImageResponse {
  final Repository repository;

  FrontImageResponse(this.repository);

  Future<Either<Failure, Uint8List>> execute(String image) {
    return repository.imgFrontResponse(image);
  }
}
