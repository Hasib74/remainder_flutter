import 'package:dio/dio.dart';
import 'package:filednote/core/extension/dio_error_extension.dart';
import 'package:filednote/core/network/dio_client.dart';
import 'package:filednote/core/response/appResponse.dart';
import 'package:filednote/core/response/error.dart';
import 'package:filednote/presentation/disease/data/repository/disease_repository.dart';
import 'package:fpdart/src/either.dart';

import '../../../../core/network/common/network_common.dart';
import '../../../../core/network/urls/app_urls.dart';

class DiseaseService extends DiseaseRepository {
  DioClient dioClient = DioClient();

  @override
  Future<Either<AppError, AppResponse>> addDiseaseSupportCrops(int id) {
    // TODO: implement addDiseaseSupportCrops
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppResponse>> createDisease(
      Map<String, dynamic> data) {
    // TODO: implement createDisease
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppResponse>> deleteDisease(
      Map<String, dynamic> data) {
    // TODO: implement deleteDisease
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppResponse>> getAllDisease() async {
    try {
      final response = await dioClient.dio.get(AppUrls.disease,
          options: Options(headers: await AppNetworkCommon.header()));
      return Right(AppResponse(
        data: response.data,
      ));
    } on DioException catch (e) {
      e.showMessage();
      return Left(AppError(
        message: e.toString(),
      ));
    }
  }

  @override
  Future<Either<AppError, AppResponse>> getDiseaseById(int id) {
    // TODO: implement getDiseaseById
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppResponse>> removeDiseaseSupportCrops(int id) {
    // TODO: implement removeDiseaseSupportCrops
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppResponse>> updateDisease(
      Map<String, dynamic> data) {
    // TODO: implement updateDisease
    throw UnimplementedError();
  }
}
