import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:filednote/core/network/dio_client.dart';
import 'package:filednote/core/network/urls/app_urls.dart';
import 'package:filednote/core/response/appResponse.dart';
import 'package:filednote/core/response/error.dart';
import 'package:filednote/presentation/auth/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';
import 'package:filednote/core/extension/dio_error_extension.dart';

class AuthService extends AuthRepository {
  DioClient dioClient = DioClient();

  @override
  Future<Either<AppError, AppResponse>> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppResponse>> signInWithEmailAndPassword(
      Map<String, String> body) async {
    try {
      final response = await dioClient.dio.post(AppUrls.login,
          data: FormData.fromMap(body),
          options: Options(headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          }));
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
  Future<Either<AppError, AppResponse>> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppResponse>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppResponse>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, AppResponse>> signUpWithEmailAndPassword(
      Map<String, String> body) async {
    print("body : == > ${body} ");
    try {
      final response = await dioClient.dio
          .post(AppUrls.registration, data: jsonEncode(body));
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
}
