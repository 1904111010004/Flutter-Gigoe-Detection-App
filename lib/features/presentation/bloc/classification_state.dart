part of 'classification_bloc.dart';

sealed class ClassificationState extends Equatable {
  const ClassificationState();

  @override
  List<Object> get props => [];
}

final class ClassificationInitial extends ClassificationState {}

final class ClassificationLoading extends ClassificationState {}

final class ClassificationError extends ClassificationState {
  final String message;

  const ClassificationError(this.message);

  @override
  List<Object> get props => [message];
}

class CombinedClassificationState extends ClassificationState {
  final Caries frontData;
  final Caries rightData;
  final Caries leftData;
  final Caries upperData;
  final Caries lowerData;

  const CombinedClassificationState({
    required this.frontData,
    required this.rightData,
    required this.leftData,
    required this.upperData,
    required this.lowerData,
  });

  @override
  List<Object> get props => [
        frontData,
        rightData,
        leftData,
        upperData,
        lowerData,
      ];
}
