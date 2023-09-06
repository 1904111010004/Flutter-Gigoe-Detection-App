import 'package:equatable/equatable.dart';

class Prediction extends Equatable {
  final double? confidence;
  final String? predictionClass;

  const Prediction({
    this.confidence,
    this.predictionClass,
  });

  @override
  List<Object?> get props {
    return [
      confidence,
      predictionClass,
    ];
  }
}
