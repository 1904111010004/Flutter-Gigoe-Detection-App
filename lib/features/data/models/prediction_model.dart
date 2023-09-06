import 'package:equatable/equatable.dart';

import '../../domain/entities/prediction.dart';

class PredictionModel extends Equatable {
  final double? confidence;
  final String? predictionClass;

  const PredictionModel({
    this.confidence,
    this.predictionClass,
  });

  factory PredictionModel.fromJson(Map<String, dynamic> json) =>
      PredictionModel(
        confidence: (json['confidence'] as num?)?.toDouble(),
        predictionClass: json['class'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'confidence': confidence,
        'class': predictionClass,
      };

  Prediction toEntity() => Prediction(
        predictionClass: predictionClass,
        confidence: confidence,
      );

  @override
  List<Object?> get props => [
        confidence,
        predictionClass,
      ];
}
