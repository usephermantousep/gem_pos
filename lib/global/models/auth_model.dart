part of "package:gempos/global/models.dart";

class AuthModel extends Equatable {
  final String token;
  final UserModel user;
  const AuthModel({required this.token, required this.user});

  AuthModel copyWith({String? token, UserModel? user, bool? isRemember}) {
    return AuthModel(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  factory AuthModel.init() => AuthModel(
        token: '',
        user: UserModel.init(),
      );

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [token, user];
}
