part of '../models.dart';

class HomeMenu extends Equatable {
  final String title;
  final Icon icon;
  final Function() ontap;

  const HomeMenu(
      {required this.icon, required this.ontap, required this.title});

  @override
  List<Object?> get props => [icon, title, ontap];
}
