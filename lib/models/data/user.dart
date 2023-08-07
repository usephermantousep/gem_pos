part of '../models.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String username;
  final bool isActive;
  final BranchModel branch;
  final RoleModel role;

  const UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.isActive,
    required this.branch,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        isActive: json['is_active'] == 1,
        branch: BranchModel.fromJson(json['branch']),
        role: RoleModel.fromJson(json['role']),
      );

  @override
  List<Object?> get props => [
        id,
        name,
        username,
        isActive,
        branch,
        role,
      ];
}
