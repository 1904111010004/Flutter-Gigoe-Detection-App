part of 'classification_bloc.dart';

sealed class ClassificationEvent extends Equatable {
  const ClassificationEvent();

  @override
  List<Object> get props => [];
}

class OnCombinedClassification extends ClassificationEvent {
  final String frontImage;
  final String rightImage;
  final String leftImage;
  final String upperImage;
  final String lowerImage;

  const OnCombinedClassification({
    required this.frontImage,
    required this.rightImage,
    required this.leftImage,
    required this.upperImage,
    required this.lowerImage,
  });

  @override
  List<Object> get props => [
        frontImage,
        rightImage,
        leftImage,
        upperImage,
        lowerImage,
      ];
}

class OnFrontImageClassification extends ClassificationEvent {
  final String image;

  const OnFrontImageClassification(this.image);

  @override
  List<Object> get props => [image];
}

class OnRightClassification extends ClassificationEvent {
  final String image;

  const OnRightClassification(this.image);

  @override
  List<Object> get props => [image];
}

class OnLeftClassification extends ClassificationEvent {
  final String image;

  const OnLeftClassification(this.image);

  @override
  List<Object> get props => [image];
}

class OnUpperClassification extends ClassificationEvent {
  final String image;

  const OnUpperClassification(this.image);

  @override
  List<Object> get props => [image];
}

class OnLowerClassification extends ClassificationEvent {
  final String image;

  const OnLowerClassification(this.image);

  @override
  List<Object> get props => [image];
}
