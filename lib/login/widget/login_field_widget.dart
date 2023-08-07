part of 'package:gem_pos/global/widgets.dart';

class LoginField extends StatelessWidget {
  const LoginField(
      {super.key,
      required this.passwordController,
      required this.usernameController});

  final TextEditingController usernameController;
  final TextEditingController passwordController;
  static bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return GreyContainer(
      child: Column(
        children: [
          TextFieldInput(
            keyboardType: TextInputType.text,
            maxLines: 1,
            hintText: 'Username',
            controller: usernameController,
            iconPrefix: Icons.people_alt,
            validator: (value) => value == null || value.isEmpty
                ? 'Wajib di isi'
                : value.length < 3
                    ? 'Minimal 3 karakter'
                    : null,
          ),
          const DefaultGapHigh(height: AppConstant.defaultPadding / 2),
          StatefulBuilder(
            builder: (context, setState) => TextFieldInput(
              keyboardType: TextInputType.visiblePassword,
              maxLines: 1,
              hintText: 'Password',
              controller: passwordController,
              iconPrefix: Icons.lock,
              isPassword: isShowPassword,
              validator: (value) => value == null || value.isEmpty
                  ? 'Wajib di isi'
                  : value.length < 3
                      ? 'Minimal 3 karakter'
                      : null,
              suffixTap: () => setState(() => isShowPassword = !isShowPassword),
              iconSuffix:
                  isShowPassword ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ],
      ),
    );
  }
}
