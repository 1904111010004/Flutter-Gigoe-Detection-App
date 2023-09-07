part of 'img_response_bloc.dart';

sealed class ImgResponseEvent extends Equatable {
  const ImgResponseEvent();

  @override
  List<Object> get props => [];
}

class OnCombinedImgResponse extends ImgResponseEvent {
  final String frontImage;
  final String rightImage;
  final String leftImage;
  final String upperImage;
  final String lowerImage;

  const OnCombinedImgResponse({
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
