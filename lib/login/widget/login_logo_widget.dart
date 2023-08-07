part of 'package:gem_pos/global/widgets.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstant.defaultPadding * 2),
          image: const DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/image/main_image.jpg',
            ),
          ),
        ),
      );
}
