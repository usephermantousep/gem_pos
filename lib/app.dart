import 'package:flutter/material.dart';
import 'package:gempos/global/cubits.dart';
import 'package:gempos/global/services.dart';
import 'package:get_it/get_it.dart';
import 'flavors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gempos/core/routes/route.dart' as route;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final getit = GetIt.I;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            getit<AuthService>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: F.title,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: route.controller,
        initialRoute: route.loginScreen,
      ),
    );
  }
}
