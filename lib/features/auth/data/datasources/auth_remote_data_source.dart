import 'package:flutter_starter/core/error/exceptions.dart';
import 'package:flutter_starter/features/auth/data/models/user_model.dart';

/// Abstract interface for authentication remote data source
///
/// This interface defines the contract for authentication operations that
/// involve external data sources like REST APIs, GraphQL endpoints, etc.
/// It follows the Data Source pattern to abstract the data access logic.
abstract interface class AuthRemoteDataSource {
  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      // TODO: Replace with actual API call
      // Example: final response = await _apiClient.post('/auth/login', {
      //   'email': email,
      //   'password': password,
      // });
      final response = null;

      if (response.user == null) {
        throw const ServerException('User is null!');
      }

      // Convert the response to UserModel
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // TODO: Replace with actual API call
      // Example: final response = await _apiClient.post('/auth/signup', {
      //   'name': name,
      //   'email': email,
      //   'password': password,
      // });
      final response = null;

      if (response.user == null) {
        throw const ServerException('User is null!');
      }

      // Convert the response to UserModel
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
