// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:gigoe_detection_app/features/domain/usecases/left_tooth_class.dart';
// import 'package:gigoe_detection_app/features/domain/usecases/lower_tooth_class.dart';
// import 'package:gigoe_detection_app/features/domain/usecases/right_tooth_class.dart';
// import 'package:gigoe_detection_app/features/domain/usecases/upper_tooth_class.dart';
// import '../../domain/entities/caries.dart';

// import '../../domain/usecases/front_tooth_class.dart';

// part 'classification_event.dart';
// part 'classification_state.dart';

// class ClassificationBloc
//     extends Bloc<ClassificationEvent, ClassificationState> {
//   final CreateFrontImageClassification _frontClassification;
//   final CreateRightImageClassification _rightClassification;
//   final CreateLeftImageClassification _leftClassification;
//   final CreateUpperImageClassification _upperClassification;
//   final CreateLowerImageClassification _lowerClassification;

//   ClassificationBloc(
//     this._frontClassification,
//     this._rightClassification,
//     this._leftClassification,
//     this._upperClassification,
//     this._lowerClassification,
//   ) : super(ClassificationInitial()) {
//     on<OnFrontImageClassification>((event, emit) async {
//       await _imageClassification(
//         event.image,
//         emit,
//         _frontClassification.execute,
//         (data) => FrontImageClassificationState(data),
//       );
//     });

//     on<OnRightClassification>((event, emit) async {
//       await _imageClassification(
//         event.image,
//         emit,
//         _rightClassification.execute,
//         (data) => RightImageClassificationState(data),
//       );
//     });

//     on<OnLeftClassification>((event, emit) async {
//       await _imageClassification(
//         event.image,
//         emit,
//         _leftClassification.execute,
//         (data) => LeftImageClassificationState(data),
//       );
//     });

//     on<OnUpperClassification>((event, emit) async {
//       await _imageClassification(
//         event.image,
//         emit,
//         _upperClassification.execute,
//         (data) => UpperImageClassificationState(data),
//       );
//     });

//     on<OnLowerClassification>((event, emit) async {
//       await _imageClassification(
//         event.image,
//         emit,
//         _lowerClassification.execute,
//         (data) => LowerImageClassificationState(data),
//       );
//     });
//   }

//   Future<void> _imageClassification(
//     String imagePath,
//     Emitter<ClassificationState> emit,
//     Future Function(String imagePath) classificationFunction,
//     ClassificationState Function(Caries data) stateFunction,
//   ) async {
//     emit(ClassificationLoading());

//     final result = await classificationFunction(imagePath);

//     result.fold(
//       (failure) => emit(CariesError(failure.message)),
//       (data) => emit(stateFunction(data)),
//     );
//   }
// }
