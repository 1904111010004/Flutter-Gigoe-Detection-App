import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/caries.dart';
import '../repositories/repository.dart';

class CreateRightImageClassification {
  final Repository repository;

  CreateRightImageClassification(this.repository);

  Future<Either<Failure, Caries>> execute(String image) {
    return repository.rightImageClassification(image);
  }
}

class RightImageResponse {
  final Repository repository;

  RightImageResponse(this.repository);

  Future<Either<Failure, Uint8List>> execute(String image) {
    return repository.imgRightResponse(image);
  }
}
