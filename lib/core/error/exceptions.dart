/// Exception thrown when there's an error communicating with the server
///
/// This exception is used in the data layer to represent errors that occur
/// when making API calls or communicating with external services.
/// It's typically caught and converted to a Failure in the repository layer.
class ServerException implements Exception {
  final String message;

  /// Creates a new ServerException with the given error message
  const ServerException(this.message);
}
