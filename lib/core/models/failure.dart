class Failure {
  final String? message;
  final StackTrace? stackTrace;
  Failure({
    this.message = "Something went wrong",
    this.stackTrace,
  });

  @override
  String toString() => message!;
  String toDebugString() =>
      'Failure(message: $message, stackTrace: $stackTrace)';
}
