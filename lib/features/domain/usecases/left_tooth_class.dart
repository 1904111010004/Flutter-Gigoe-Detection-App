import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/caries.dart';
import '../repositories/repository.dart';

class CreateLeftImageClassification {
  final Repository repository;

  CreateLeftImageClassification(this.repository);

  Future<Either<Failure, Caries>> execute(String image) {
    return repository.leftImageClassification(image);
  }
}

class LeftImageResponse {
  final Repository repository;

  LeftImageResponse(this.repository);

  Future<Either<Failure, Uint8List>> execute(String image) {
    return repository.imgLeftResponse(image);
  }
}
