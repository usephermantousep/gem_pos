part of '../models.dart';

class HomeState extends Equatable {
  final UserModel? user;
  final List<HomeMenu> menus;

  const HomeState({this.user, this.menus = const []});

  HomeState copyWith({UserModel? user, List<HomeMenu>? menus}) =>
      HomeState(user: user ?? this.user, menus: menus ?? this.menus);
  @override
  List<Object?> get props => [user];
}
