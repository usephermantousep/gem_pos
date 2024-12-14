part of "package:gempos/global/models.dart";

class StoreModel extends Equatable {
  const StoreModel({
    required this.id,
    required this.name,
    this.address,
    this.contact,
    this.logo,
    this.isActive = true,
  });

  final int id;
  final String name;
  final String? address;
  final String? contact;
  final String? logo;
  final bool isActive;

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        contact,
        logo,
        isActive,
      ];

  StoreModel copyWith({
    String? name,
    String? address,
    String? contact,
    String? logo,
    bool? isActive,
  }) {
    return StoreModel(
      id: id,
      name: name ?? this.name,
      address: address ?? this.address,
      contact: contact ?? this.contact,
      logo: logo ?? this.logo,
      isActive: isActive ?? this.isActive,
    );
  }

  factory StoreModel.fromMap(Map<String, dynamic> map) {
    return StoreModel(
      id: map['id'],
      name: map['name'],
    );
  }

  factory StoreModel.init() => const StoreModel(id: 0, name: '');

  @override
  bool get stringify => true;
}
