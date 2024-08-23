class ApiException implements Exception {
  int statusCode;
  String errorCode;
  String message;
  dynamic data;

  ApiException(
      {this.statusCode = 0, this.errorCode = '', this.message = '', this.data});
}
