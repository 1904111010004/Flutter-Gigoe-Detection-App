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
      ));

  // USE CASE
  locator.registerLazySingleton(
    () => CreateFrontImageClassification(locator()),
  );
  locator.registerLazySingleton(
    () => FrontImageResponse(locator()),
  );

  locator.registerLazySingleton(
    () => CreateRightImageClassification(locator()),
  );

  locator.registerLazySingleton(
    () => CreateLeftImageClassification(locator()),
  );

  locator.registerLazySingleton(
    () => CreateUpperImageClassification(locator()),
  );

  locator.registerLazySingleton(
    () => CreateLowerImageClassification(locator()),
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
