import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:filednote/core/extension/dio_error_extension.dart';
import 'package:filednote/core/network/dio_client.dart';
import 'package:filednote/core/response/appResponse.dart';
import 'package:filednote/core/response/error.dart';
import 'package:fpdart/src/either.dart';

import '../../../../core/network/common/network_common.dart';
import '../../../../core/network/urls/app_urls.dart';
import '../repository/crops_repository.dart';

class CropsService extends CropsRepository {
  DioClient dioClient = DioClient();

  @override
  Future<Either<AppError, AppResponse>> addCrop(
      Map<String, dynamic> data) async {
    try {
      final response = await dioClient.dio.post(AppUrls.crops,
          options: Options(
            headers: await AppNetworkCommon.header(),
          ),
          data: jsonEncode(data));
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
  Future<Either<AppError, AppResponse>> deleteCrop(
      Map<String, dynamic> data) async {
    try {
      final response = await dioClient.dio.delete("${AppUrls.crops}/${data["crop_id"]}",
          options: Options(
            headers: await AppNetworkCommon.header(),
          ),
         );
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
  Future<Either<AppError, AppResponse>> getAllCrops() async {
    try {
      final response = await dioClient.dio.get(AppUrls.crops,
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
  Future<Either<AppError, AppResponse>> getCropById(int id) {
    // TODO: implement getCropById
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppResponse>> updateCrop(Map<String, dynamic> data) {
    // TODO: implement updateCrop
    throw UnimplementedError();
  }
}
