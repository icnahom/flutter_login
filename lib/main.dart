import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/cubit/auth_cubit.dart';
import 'auth/cubit/auth_state.dart';
import 'auth/pages/login_page.dart';
import 'auth/pages/login_progress_page.dart';
import 'home/pages/home_page.dart';
import 'service_locator.dart';
import 'shared/themes/dark_theme.dart';
import 'shared/themes/light_theme.dart';

void main() {
  setupServiceLocator(testing: true);
  runApp(
    BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: getLightTheme(),
      darkTheme: getDarKTheme(),
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          const loginPage = MyLoginPage();
          return state.when(
            initial: () => loginPage,
            loading: () => const MyLoginProgressPage(),
            failure: (_) => loginPage,
            success: (user) => MyHomePage(user: user),
          );
        },
      ),
    );
  }
}
