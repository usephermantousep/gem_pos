part of "package:gempos/global/models.dart";

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.roles = const [],
    this.store,
  });

  final int id;
  final String name;
  final String email;
  final List<RoleModel> roles;
  final StoreModel? store;

  @override
  List<Object?> get props => [id, name, email];

  UserModel copyWith({String? name, String? email, List<RoleModel>? roles, StoreModel? store}) =>
      UserModel(
        id: id,
        name: name ?? this.name,
        email: email ?? this.email,
        roles: roles ?? this.roles,
        store: store ?? this.store,
      );

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      roles: List<RoleModel>.from(map['roles'].map((x) => RoleModel.fromMap(x))),
      store: StoreModel.fromMap(map['store']),
    );
  }

  factory UserModel.init() => UserModel(
        id: 0,
        name: '',
        email: '',
        roles: [],
      );

  @override
  bool get stringify => true;
}
