import 'package:flutter/material.dart';

class MyLoginForm extends StatelessWidget {
  const MyLoginForm(
      {super.key, required this.usernameController, required this.passwordController});
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Hey there!',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            'Let\'s get you started.',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          TextFormField(
            controller: usernameController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'Username'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter username';
              }
              return null;
            },
          ),
          TextFormField(
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
