part of "package:gempos/global/models.dart";

class RoleModel extends Equatable {
  const RoleModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  RoleModel copyWith({String? name, String? email, String? company}) {
    return RoleModel(id: id, name: name ?? this.name);
  }

  factory RoleModel.fromMap(Map<String, dynamic> map) {
    return RoleModel(
      id: map['id'],
      name: map['name'],
    );
  }

  factory RoleModel.init() => const RoleModel(id: 0, name: '');

  @override
  bool get stringify => true;
}
