import 'package:flutter/material.dart';
import 'package:mynote/constant/route.dart';
import 'package:mynote/services/auth/auth_services.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Column(
        children: [
          const Text(
              "we've sent you your email verification. please open to verify your account."),
          const Text(
              "please if you haven't recieved a email verifiaction yet, press the button below"),
          TextButton(
            onPressed: (() async {
              await AuthService.firebase().emailVerification();
            }),
            child: const Text('Send Email Verification'),
          ),
          TextButton(
            onPressed: (() async {
              await AuthService.firebase().logOut();
              // ignore: use_build_context_synchronously
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(registerRoute, (route) => false);
            }),
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }
}
