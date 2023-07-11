class Failure {
  final int statusCode;
  final String message;
  const Failure(this.statusCode, this.message);

  @override
  String toString() {
    return message;
  }
}
