// part of 'img_response_bloc.dart';

// sealed class ImgResponseState extends Equatable {
//   const ImgResponseState();

//   @override
//   List<Object> get props => [];
// }

// final class ImgResponseInitial extends ImgResponseState {}

// final class ImgResponseLoading extends ImgResponseState {}

// final class ImgResponseError extends ImgResponseState {
//   final String message;

//   const ImgResponseError(this.message);

//   @override
//   List<Object> get props => [message];
// }

// final class ImgResponseFrontData extends ImgResponseState {
//   final Uint8List imgUint8List;

//   const ImgResponseFrontData(this.imgUint8List);

//   @override
//   List<Object> get props => [imgUint8List];
// }

// final class ImgResponseRightData extends ImgResponseState {
//   final Uint8List imgUint8List;

//   const ImgResponseRightData(this.imgUint8List);

//   @override
//   List<Object> get props => [imgUint8List];
// }

// final class ImgResponseLeftData extends ImgResponseState {
//   final Uint8List imgUint8List;

//   const ImgResponseLeftData(this.imgUint8List);

//   @override
//   List<Object> get props => [imgUint8List];
// }

// final class ImgResponseUpperData extends ImgResponseState {
//   final Uint8List imgUint8List;

//   const ImgResponseUpperData(this.imgUint8List);

//   @override
//   List<Object> get props => [imgUint8List];
// }

// final class ImgResponseLowerData extends ImgResponseState {
//   final Uint8List imgUint8List;

//   const ImgResponseLowerData(this.imgUint8List);

//   @override
//   List<Object> get props => [imgUint8List];
// }
