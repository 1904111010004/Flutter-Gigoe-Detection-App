import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../entities/caries.dart';
import '../repositories/repository.dart';

class CreateUpperImageClassification {
  final Repository repository;

  CreateUpperImageClassification(this.repository);

  Future<Either<Failure, Caries>> execute(String image) {
    return repository.upperImageClassification(image);
  }
}

class UpperImageResponse {
  final Repository repository;

  UpperImageResponse(this.repository);

  Future<Either<Failure, Uint8List>> execute(String image) {
    return repository.imgRightResponse(image);
  }
}
