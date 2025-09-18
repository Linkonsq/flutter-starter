import 'package:flutter_starter/core/error/failures.dart';
import 'package:flutter_starter/core/usecase/usecase.dart';
import 'package:flutter_starter/features/auth/domain/entities/user.dart';
import 'package:flutter_starter/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

/// Use case for user login functionality
///
/// This use case encapsulates the business logic for authenticating a user
/// with email and password. It follows the Clean Architecture principle by
/// containing only application-specific business rules and being independent
/// of external concerns like UI or data sources.
class UserLogin implements UseCase<User, UserLoginParams> {
  final AuthRepository _authRepository;

  const UserLogin(this._authRepository);

  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return await _authRepository.loginWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({required this.email, required this.password});
}
