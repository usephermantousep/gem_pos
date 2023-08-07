part of '../../global/screens.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingButton(
          ontap: () async {
            if (controller.formkey.currentState?.validate() ?? false) {
              await controller.login().then((res) {
                if (res.value == null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    res.message ?? 'Error',
                  )));
                  return;
                }

                final controller = Get.put(HomeController());
                controller.updateHomeState(user: res.value, menus: menusInit);

                Get.to(() => const HomeScreen());
              });
            }
          },
          label: 'Login'),
      body: Form(
        key: controller.formkey,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          padding: const EdgeInsets.all(AppConstant.defaultPadding),
          children: [
            const DefaultGapHigh(height: AppConstant.defaultPadding * 3),
            const LoginLogo(),
            const DefaultGapHigh(height: AppConstant.defaultPadding * 2),
            Text(
              'GEM POS',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const DefaultGapHigh(height: AppConstant.defaultPadding),
            LoginField(
              passwordController: controller.passwordController,
              usernameController: controller.usernameController,
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom < 160
                  ? 0
                  : MediaQuery.of(context).viewInsets.bottom -
                      (AppConstant.defaultPadding * 10),
            )
          ],
        ),
      ),
    );
  }
}
