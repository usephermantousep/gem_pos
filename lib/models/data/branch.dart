part of '../models.dart';

class BranchModel extends Equatable {
  final int id;
  final String name;

  const BranchModel({
    required this.id,
    required this.name,
  });
  @override
  List<Object> get props => [id, name];

  BranchModel copyWith({
    int? id,
    String? name,
  }) =>
      BranchModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
        id: json['id'],
        name: json['name'],
      );
}
