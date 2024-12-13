part of "package:gempos/global/models.dart";

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.company,
  });

  final int id;
  final String name;
  final String email;
  final String company;

  @override
  List<Object?> get props => [name, email, company];

  UserModel copyWith({String? name, String? email, String? company}) {
    return UserModel(
        id: id,
        name: name ?? this.name,
        email: email ?? this.email,
        company: company ?? this.company);
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      company: map['company'],
    );
  }

  factory UserModel.init() => const UserModel(id: 0, name: '', email: '', company: '');

  @override
  bool get stringify => true;
}
