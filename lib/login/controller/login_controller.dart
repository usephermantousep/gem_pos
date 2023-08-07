part of '../../global/controllers.dart';

class LoginController extends GetxController {
  late AuthService _authService;
  late TextEditingController usernameController, passwordController;
  final formkey = GlobalKey<FormState>();

  Future<ApiReturnValue<UserModel?>> login() async {
    final data = LoginDto(
        username: usernameController.text.trim(),
        password: passwordController.text.trim());

    return await _authService.login(data);
  }

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    _authService = GetIt.instance.get<AuthService>();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
