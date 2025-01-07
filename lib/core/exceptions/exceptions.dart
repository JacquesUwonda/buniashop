class ServerException implements Exception {
  final String reason;
  ServerException({this.reason = ""});
}
