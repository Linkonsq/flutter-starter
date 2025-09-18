import 'package:flutter_starter/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

/// Abstract base class for all use cases in the application
///
/// This follows the Clean Architecture principle where use cases encapsulate
/// application-specific business rules. Each use case represents a single
/// business operation and is independent of the UI and data sources.
///
/// [SuccessType] - The type of data returned on successful execution
/// [Params] - The type of parameters required for the use case
///
/// The use case returns an Either type which can contain either:
/// - Left: A Failure object indicating what went wrong
/// - Right: The successful result of type SuccessType
abstract interface class UseCase<SuccessType, Params> {
  /// Executes the use case with the provided parameters
  ///
  /// Returns a Future that completes with either a Failure or SuccessType
  Future<Either<Failure, SuccessType>> call(Params params);
}

/// Empty parameter class for use cases that don't require any input
///
/// This is used when a use case doesn't need any parameters to execute.
/// For example, a use case that fetches all users might not need any parameters.
class NoParams {}
