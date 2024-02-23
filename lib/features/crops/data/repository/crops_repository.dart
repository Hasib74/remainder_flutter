import 'package:filednote/core/response/appResponse.dart';
import 'package:filednote/core/response/error.dart';
import 'package:fpdart/fpdart.dart';

abstract class CropsRepository {
  Future<Either<AppError, AppResponse>> getAllCrops();

  Future<Either<AppError, AppResponse>> getCropById(int id);

  Future<Either<AppError, AppResponse>> addCrop(Map<String, dynamic> data);

  Future<Either<AppError, AppResponse>> updateCrop(Map<String, dynamic> data);

  Future<Either<AppError, AppResponse>> deleteCrop(Map<String,dynamic> data);
}
