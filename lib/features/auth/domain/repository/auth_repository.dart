import 'package:flutter_starter/core/error/failures.dart';
import 'package:flutter_starter/features/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

/// Abstract repository interface for authentication operations
///
/// This interface defines the contract for authentication operations in the
/// domain layer. It follows the Repository pattern which abstracts the data
/// access logic and provides a clean interface for the domain layer.
///
/// The repository pattern helps to:
/// - Decouple the domain layer from data sources
/// - Make the code more testable
/// - Provide a single source of truth for data access
abstract interface class AuthRepository {
  Future<Either<Failure, User>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
}
