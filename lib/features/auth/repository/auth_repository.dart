import 'package:filednote/core/network/dio_client.dart';
import 'package:filednote/core/response/appResponse.dart';
import 'package:filednote/core/response/error.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<AppError, AppResponse>> signInWithGoogle();

  Future<Either<AppError, AppResponse>> signInWithFacebook();

  Future<Either<AppError, AppResponse>> signInWithApple();

  Future<Either<AppError, AppResponse>> signInWithEmailAndPassword(
      Map<String, String> body);

  Future<Either<AppError, AppResponse>> signUpWithEmailAndPassword(
      Map<String, String> body);

  Future<Either<AppError, AppResponse>> signOut();
}
