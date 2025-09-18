import 'package:flutter_starter/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.id, required super.name, required super.email});

  /// Creates a UserModel from JSON data
  ///
  /// This factory constructor is used to deserialize JSON data received from
  /// external sources (APIs, local storage, etc.) into a UserModel instance.
  ///
  /// [json] - Map containing the JSON data
  ///
  /// Returns a UserModel instance with data from the JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }

  /// Creates a copy of this UserModel with some fields replaced
  ///
  /// This method is useful for creating modified versions of a UserModel
  /// without changing the original instance (immutability).
  ///
  /// [id] - New id value (optional)
  /// [name] - New name value (optional)
  /// [email] - New email value (optional)
  ///
  /// Returns a new UserModel instance with the specified fields updated
  UserModel copyWith({String? id, String? name, String? email}) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
