part of '../../global/controllers.dart';

class HomeController extends GetxController {
  Rx<HomeState> homeState = const HomeState().obs;

  updateHomeState({UserModel? user, List<HomeMenu>? menus}) =>
      homeState.value = homeState.value.copyWith(user: user, menus: menus);
}
