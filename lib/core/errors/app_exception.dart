class AppException implements Exception {
  String? exception;
  String? reason;
  String? localizeMessage;
  AppException({this.reason, this.exception, this.localizeMessage});

  @override
  String toString() =>
      localizeMessage ?? reason ?? exception ?? "invalid-error";
}
