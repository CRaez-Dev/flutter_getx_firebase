import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_firebase/screen/login/login_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => CupertinoPageScaffold(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoTextField(
                      controller: _.emailTextEditcontroller.value,
                      placeholder: "Email",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CupertinoTextField(
                      controller: _.passwordTextEditcontroller.value,
                      placeholder: "Password",
                      // obscureText: true,                      
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CupertinoButton.filled(
                      onPressed: _.handleSignInLinkToEmail,
                      child: const Text("Login with Email"),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CupertinoButton.filled(
                      onPressed: _.handleSignInWithGoogle,
                      child: const Text("Login with Google"),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
