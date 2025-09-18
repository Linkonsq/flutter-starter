import 'package:flutter_starter/core/error/exceptions.dart';
import 'package:flutter_starter/core/error/failures.dart';
import 'package:flutter_starter/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_starter/features/auth/domain/entities/user.dart';
import 'package:flutter_starter/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

/// Implementation of AuthRepository
///
/// This class implements the AuthRepository interface and serves as the
/// concrete implementation for authentication operations. It acts as a bridge
/// between the domain layer and the data sources, handling error conversion
/// and data transformation.
///
/// The repository pattern helps to:
/// - Abstract data access logic
/// - Convert exceptions to failures
/// - Provide a single source of truth for data operations
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  const AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await _remoteDataSource.loginWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await _remoteDataSource.signUpWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  /// Helper method to handle user operations and error conversion
  ///
  /// This method wraps the execution of user operations and converts
  /// any exceptions that occur into appropriate failures for the domain layer.
  ///
  /// [fn] - Function that returns a Future<User>
  ///
  /// Returns an Either type:
  /// - Left: Failure if an error occurs
  /// - Right: User entity if successful
  Future<Either<Failure, User>> _getUser(Future<User> Function() fn) async {
    try {
      // Execute the provided function
      final user = await fn();

      return right(user);
    } on ServerException catch (e) {
      return left(ServerFailure(e.message));
    }
  }
}
