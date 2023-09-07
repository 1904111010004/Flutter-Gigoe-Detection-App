import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:gigoe_detection_app/features/domain/usecases/front_tooth_class.dart';
import 'package:gigoe_detection_app/features/domain/usecases/left_tooth_class.dart';
import 'package:gigoe_detection_app/features/domain/usecases/lower_tooth_class.dart';
import 'package:gigoe_detection_app/features/domain/usecases/right_tooth_class.dart';
import 'package:gigoe_detection_app/features/domain/usecases/upper_tooth_class.dart';
import 'package:gigoe_detection_app/features/presentation/bloc/img_response_bloc.dart';

import 'features/data/datasources/remote_data_source.dart';
import 'features/data/repositories/repository_impl.dart';
import 'features/domain/repositories/repository.dart';
import 'features/presentation/bloc/classification_bloc.dart';

GetIt locator = GetIt.I;

Future<void> setup() async {
  // BLOC STATE INJECTION
  locator.registerFactory(() => ClassificationBloc(
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
      ));

  locator.registerFactory(() => ImgResponseBloc(
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
      ));

  // USE CASE

  // Front
  locator.registerLazySingleton(
    () => CreateFrontImageClassification(locator()),
  );
  locator.registerLazySingleton(
    () => FrontImageResponse(locator()),
  );

  // Right
  locator.registerLazySingleton(
    () => CreateRightImageClassification(locator()),
  );
  locator.registerLazySingleton(
    () => RightImageResponse(locator()),
  );

  // Left
  locator.registerLazySingleton(
    () => CreateLeftImageClassification(locator()),
  );
  locator.registerLazySingleton(
    () => LeftImageResponse(locator()),
  );

  // Upper
  locator.registerLazySingleton(
    () => CreateUpperImageClassification(locator()),
  );
  locator.registerLazySingleton(
    () => UpperImageResponse(locator()),
  );

  // Lower
  locator.registerLazySingleton(
    () => CreateLowerImageClassification(locator()),
  );
  locator.registerLazySingleton(
    () => LowerImageResponse(locator()),
  );

  // REPOSITORY INJECTION
  locator.registerLazySingleton<Repository>(
    () => RepositoryImpl(dataSource: locator()),
  );

  // DATA SOURCE INJECTION
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(dio: locator()),
  );

  // EXTERNAL
  locator.registerLazySingleton(() => Dio());
}
