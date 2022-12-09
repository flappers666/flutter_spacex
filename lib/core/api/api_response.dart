import 'api_error.dart';

class ApiResponse<T> {
  bool success = false;
  T? value;
  ApiError? apiError;

  ApiResponse({this.success = false, this.value, this.apiError});
}
