import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/caries.dart';
import '../../domain/usecases/front_tooth_class.dart';
import '../../domain/usecases/left_tooth_class.dart';
import '../../domain/usecases/lower_tooth_class.dart';
import '../../domain/usecases/right_tooth_class.dart';
import '../../domain/usecases/upper_tooth_class.dart';

part 'classification_event.dart';
part 'classification_state.dart';

class ClassificationBloc
    extends Bloc<ClassificationEvent, ClassificationState> {
  final CreateFrontImageClassification _frontClassification;
  final CreateRightImageClassification _rightClassification;
  final CreateLeftImageClassification _leftClassification;
  final CreateUpperImageClassification _upperClassification;
  final CreateLowerImageClassification _lowerClassification;

  ClassificationBloc(
    this._frontClassification,
    this._rightClassification,
    this._leftClassification,
    this._upperClassification,
    this._lowerClassification,
  ) : super(ClassificationInitial()) {
    on<OnCombinedClassification>((event, emit) async {
      emit(ClassificationLoading());

      final frontResult = await _frontClassification.execute(event.frontImage);
      final rightResult = await _rightClassification.execute(event.rightImage);
      final leftResult = await _leftClassification.execute(event.leftImage);
      final upperResult = await _upperClassification.execute(event.upperImage);
      final lowerResult = await _lowerClassification.execute(event.lowerImage);

      if (frontResult.isLeft()) {
        emit(ClassificationError(
            frontResult.fold((failure) => failure.message, (_) => '')));
        return;
      }
      if (rightResult.isLeft()) {
        emit(ClassificationError(
            rightResult.fold((failure) => failure.message, (_) => '')));
        return;
      }
      if (leftResult.isLeft()) {
        emit(ClassificationError(
            leftResult.fold((failure) => failure.message, (_) => '')));
        return;
      }
      if (upperResult.isLeft()) {
        emit(ClassificationError(
            upperResult.fold((failure) => failure.message, (_) => '')));
        return;
      }
      if (lowerResult.isLeft()) {
        emit(ClassificationError(
            lowerResult.fold((failure) => failure.message, (_) => '')));
        return;
      }

      emit(CombinedClassificationState(
        frontData: frontResult.getOrElse(() => const Caries()),
        rightData: rightResult.getOrElse(() => const Caries()),
        leftData: leftResult.getOrElse(() => const Caries()),
        upperData: upperResult.getOrElse(() => const Caries()),
        lowerData: lowerResult.getOrElse(() => const Caries()),
      ));
    });
  }
}
