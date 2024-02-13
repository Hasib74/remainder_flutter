class AppError {
  String? message;

  AppError({this.message});
}

class NotInternetError extends AppError {
  NotInternetError() {
    message = "No Internet Connection";
  }
}

class ServerError extends AppError {
  ServerError() {
    message = "Server Error";
  }
}

class UnAuthorizedError extends AppError {
  UnAuthorizedError() {
    message = "UnAuthorized";
  }
}

class NotFoundError extends AppError {
  NotFoundError() {
    message = "Not Found";
  }
}

class UnknownError extends AppError {
  UnknownError() {
    message = "Unknown Error";
  }
}
