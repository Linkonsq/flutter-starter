/// Abstract base class for all failures in the application
///
/// Failures represent errors that can occur in the domain layer and are
/// used to communicate errors from the data layer to the presentation layer.
/// This follows the Clean Architecture principle of having domain-specific
/// error handling that doesn't depend on external frameworks.
abstract class Failure {
  final String message;

  /// Creates a new Failure with an optional error message
  /// If no message is provided, a default message is used
  Failure([this.message = 'An unexpected error occurred']);
}

/// Failure that occurs when there's an error communicating with the server
///
/// This is typically thrown when API calls fail, network errors occur,
/// or the server returns an error response.
class ServerFailure extends Failure {
  /// Creates a new ServerFailure with the given error message
  ServerFailure(super.message);
}

/// Failure that occurs when there's an error with local data storage
///
/// This is typically thrown when there are issues with caching data locally,
/// reading from local storage, or any other local data operations.
class CacheFailure extends Failure {
  /// Creates a new CacheFailure with the given error message
  CacheFailure(super.message);
}
