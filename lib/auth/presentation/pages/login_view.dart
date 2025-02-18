import 'package:flutter/material.dart';
import 'package:profile/auth/presentation/widgets/recipe_password_form_field.dart';
import 'package:profile/auth/presentation/widgets/recipe_text_form_field.dart';
import 'package:profile/profile/presentation/widgets/recipe_elevated_button.dart';

import '../manager/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
    required this.vm,
  });

  final LoginViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder:(context, child)=> Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Login"),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 150),
          children: [
            Form(
              key: vm.formKey,
              child: Column(
                spacing: 10,
                children: [
                  RecipeTextFormField(
                    title: "Login",
                    hintText: "example@gmail.com",
                    validator: (value) => null,
                    controller: vm.loginController,
                  ),
                  RecipePasswordFormField(
                    title: "Password",
                    controller: vm.passwordController,
                  ),
                ],
              ),
            ),
            if (vm.hasError)
              Text(
                vm.errorMessage!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            SizedBox(height: 90),
            RecipeElevatedButton(
              text: "Login",
              fontSize: 20,
              callback: () async {
                if (vm.formKey.currentState!.validate()) {
                  if (await vm.login() && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Banzaaay!"),
                      ),
                    );
                  }
                }
              },
              size: Size(207, 45),
            ),
            SizedBox(height: 27),
            RecipeElevatedButton(
              text: "Sign Up",
              fontSize: 20,
              callback: () {},
              size: Size(207, 45),
            ),
          ],
        ),
      ),
    );
  }
}
