import 'package:flutter/material.dart';
import 'package:gem_pos/constant/constant.dart';
import 'package:gem_pos/global/controllers.dart';
import 'package:gem_pos/global/screens.dart';
import 'package:gem_pos/models/models.dart';
import 'package:gem_pos/services/auth_service.dart';
import 'package:gem_pos/theme/color.dart';
import 'package:gem_pos/theme/text_style.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final txTheme = TextStyleCustom(mainTextStyle: GoogleFonts.comfortaa());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: AppColor.bgColor),
        scaffoldBackgroundColor: AppColor.scaffoldColor,
        textTheme: TextTheme(
          titleLarge: txTheme.titleLargeStyle,
          titleMedium: txTheme.titleMediumStyle,
          titleSmall: txTheme.titleSmallStyle,
          bodyLarge: txTheme.bodyLargeStyle,
          bodyMedium: txTheme.bodyMediumStyle,
          bodySmall: txTheme.bodySmallStyle,
        ),
        useMaterial3: true,
      ),
      home: FutureBuilder<ApiReturnValue<UserModel?>>(
        future: GetIt.instance.get<AuthService>().fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.data?.value == null) {
            return const LoginScreen();
          }

          final controller = Get.put(HomeController());
          controller.updateHomeState(
              user: snapshot.data?.value, menus: menusInit);

          return const HomeScreen();
        },
      ),
    );
  }
}
