part of '../models.dart';

class LoginDto extends Equatable {
  final String username;
  final String password;

  const LoginDto({required this.username, required this.password});

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
  @override
  List<Object?> get props => [
        username,
        password,
      ];
}
