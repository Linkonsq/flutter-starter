import 'package:flutter_starter/core/error/failures.dart';
import 'package:flutter_starter/core/usecase/usecase.dart';
import 'package:flutter_starter/features/auth/domain/entities/user.dart';
import 'package:flutter_starter/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

/// Use case for user signup functionality
///
/// This use case encapsulates the business logic for creating a new user
/// account with email and password. It follows the Clean Architecture principle
/// by containing only application-specific business rules and being independent
/// of external concerns like UI or data sources.
class UserSignup implements UseCase<User, UserSignUpParams> {
  final AuthRepository _authRepository;

  const UserSignup(this._authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await _authRepository.signUpWithEmailAndPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams({
    required this.name,
    required this.email,
    required this.password,
  });
}
