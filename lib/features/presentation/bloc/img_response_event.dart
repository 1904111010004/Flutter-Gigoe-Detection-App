part of 'img_response_bloc.dart';

sealed class ImgResponseEvent extends Equatable {
  const ImgResponseEvent();

  @override
  List<Object> get props => [];
}

class OnFrontImgResponse extends ImgResponseEvent {
  final String img;

  const OnFrontImgResponse(this.img);

  @override
  List<Object> get props => [img];
}
