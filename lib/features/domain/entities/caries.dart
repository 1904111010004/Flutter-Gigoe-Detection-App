import 'package:equatable/equatable.dart';

import 'prediction.dart';

class Caries extends Equatable {
  final double? time;
  final List<Prediction>? predictions;

  const Caries({
    this.time,
    this.predictions,
  });

  @override
  List<Object?> get props => [time, predictions];
}
