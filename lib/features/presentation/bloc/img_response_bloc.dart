import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gigoe_detection_app/features/domain/usecases/front_tooth_class.dart';

part 'img_response_event.dart';
part 'img_response_state.dart';

class ImgResponseBloc extends Bloc<ImgResponseEvent, ImgResponseState> {
  final FrontImageResponse _frontImageResponse;
  ImgResponseBloc(this._frontImageResponse) : super(ImgResponseInitial()) {
    on<OnFrontImgResponse>((event, emit) async {
      await _imageResponse(
        event.img,
        emit,
        _frontImageResponse.execute,
        (data) => ImgResponseFrontData(data),
      );
    });
  }
  Future<void> _imageResponse(
    String imagePath,
    Emitter<ImgResponseState> emit,
    Future Function(String imagePath) classificationFunction,
    ImgResponseState Function(Uint8List data) stateFunction,
  ) async {
    emit(ImgResponseLoading());

    final result = await classificationFunction(imagePath);

    result.fold(
      (failure) => emit(ImgResponseError(failure.message)),
      (data) => emit(stateFunction(data)),
    );
  }
}
