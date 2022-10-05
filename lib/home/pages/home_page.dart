import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/cubit/auth_cubit.dart';
import '../../auth/models/user.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome back, ${user.username}!',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<AuthCubit>().logOut,
        child: const Icon(Icons.logout),
      ),
    );
  }
}
