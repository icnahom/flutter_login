import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/auth/cubit/auth_cubit.dart';
import 'package:flutter_login/auth/widgets/login_form.dart';

import '../models/user.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  late final _formKey = GlobalKey<FormState>();
  late final _usernameController = TextEditingController();
  late final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SizedBox.expand(
          child: FractionallySizedBox(
            heightFactor: .60,
            child: MyLoginForm(
              usernameController: _usernameController,
              passwordController: _passwordController,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final user = User(
                username: _usernameController.text,
                password: _passwordController.text,
              );
              context.read<AuthCubit>().logIn(user);
            }
          },
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
