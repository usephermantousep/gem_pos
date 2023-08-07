part of '../models.dart';

class RoleModel extends Equatable {
  final int id;
  final String name;

  const RoleModel({
    required this.id,
    required this.name,
  });
  @override
  List<Object> get props => [id, name];

  RoleModel copyWith({
    int? id,
    String? name,
  }) =>
      RoleModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id: json['id'],
        name: json['name'],
      );
}
