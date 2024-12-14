part of "package:gempos/global/models.dart";

class LoginModel extends Equatable {
  final String username;
  final String password;
  final bool obscure;

  const LoginModel({required this.username, required this.password, required this.obscure});

  LoginModel copyWith({String? username, String? password, bool? obscure}) => LoginModel(
        username: username ?? this.username,
        password: password ?? this.password,
        obscure: obscure ?? this.obscure,
      );

  factory LoginModel.init() => const LoginModel(
        username: '',
        password: '',
        obscure: true,
      );

  @override
  List<Object?> get props => [
        username,
        password,
        obscure,
      ];

  Map<String, dynamic> toMap() => {
        "email": username,
        "password": password,
      };

  @override
  String toString() => "username : $username # password $password";
}
