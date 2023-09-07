part of 'img_response_bloc.dart';

sealed class ImgResponseState extends Equatable {
  const ImgResponseState();

  @override
  List<Object> get props => [];
}

final class ImgResponseInitial extends ImgResponseState {}

final class ImgResponseLoading extends ImgResponseState {}

final class ImgResponseError extends ImgResponseState {
  final String message;

  const ImgResponseError(this.message);

  @override
  List<Object> get props => [message];
}

final class ImgResponseFrontData extends ImgResponseState {
  final Uint8List imgUint8List;

  const ImgResponseFrontData(this.imgUint8List);

  @override
  List<Object> get props => [imgUint8List];
}

final class ImgResponseRightData extends ImgResponseState {
  final Uint8List imgUint8List;

  const ImgResponseRightData(this.imgUint8List);

  @override
  List<Object> get props => [imgUint8List];
}

final class ImgResponseLeftData extends ImgResponseState {
  final Uint8List imgUint8List;

  const ImgResponseLeftData(this.imgUint8List);

  @override
  List<Object> get props => [imgUint8List];
}

final class ImgResponseUpperData extends ImgResponseState {
  final Uint8List imgUint8List;

  const ImgResponseUpperData(this.imgUint8List);

  @override
  List<Object> get props => [imgUint8List];
}

final class ImgResponseLowerData extends ImgResponseState {
  final Uint8List imgUint8List;

  const ImgResponseLowerData(this.imgUint8List);

  @override
  List<Object> get props => [imgUint8List];
}

class CombinedImgResponseState extends ImgResponseState {
  final Uint8List frontImgUint8List;
  final Uint8List rightImgUint8List;
  final Uint8List leftImgUint8List;
  final Uint8List upperImgUint8List;
  final Uint8List lowerImgUint8List;

  const CombinedImgResponseState({
    required this.frontImgUint8List,
    required this.rightImgUint8List,
    required this.leftImgUint8List,
    required this.upperImgUint8List,
    required this.lowerImgUint8List,
  });

  @override
  List<Object> get props => [
        frontImgUint8List,
        rightImgUint8List,
        leftImgUint8List,
        upperImgUint8List,
        lowerImgUint8List,
      ];
}
