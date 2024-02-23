import 'package:fpdart/fpdart.dart';

import '../../../../core/response/appResponse.dart';
import '../../../../core/response/error.dart';

abstract class DiseaseRepository {
  Future<Either<AppError, AppResponse>> createDisease(
      Map<String, dynamic> data);

  Future<Either<AppError, AppResponse>> getAllDisease(
      );

  Future<Either<AppError, AppResponse>> getDiseaseById(int id);

  Future<Either<AppError, AppResponse>> updateDisease(
      Map<String, dynamic> data);

  Future<Either<AppError, AppResponse>> deleteDisease(
      Map<String, dynamic> data);

  Future<Either<AppError, AppResponse>> addDiseaseSupportCrops(int id);

  Future<Either<AppError, AppResponse>> removeDiseaseSupportCrops(int id);
}
