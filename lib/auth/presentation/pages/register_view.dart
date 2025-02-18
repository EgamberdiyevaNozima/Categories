import 'package:flutter/material.dart';
import 'package:recipe_app_project1/auth/presentation/manager/register_view_model.dart';
import '../../../core/colors.dart';
import '../../../onboarding/profile/presentation/widgets/recipe_elevated_button.dart';
import '../manager/login_view_model.dart';
import '../widgets/recipe_password_form_field.dart';
import '../widgets/recipe_text_form_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({
    super.key,
    required this.vm,
  });

  final RegisterViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder:(context, child)=> Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Sign up"),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 30),
          children: [
            Form(
              key: vm.formKey,
              child: Column(
                spacing: 10,
                children: [
                  RecipePasswordFormField(
                    title: "Full Name",
                    hintText: "John Doe",
                    hintStyle: TextStyle(
                      letterSpacing: 5,
                      color: AppColors.beigeColor.withValues(alpha: 0.45),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: vm.fullNameController,
                  ),
                  RecipePasswordFormField(
                    title: "Email",
                    hintText: "example@example.com",
                    hintStyle: TextStyle(
                      letterSpacing: 5,
                      color: AppColors.beigeColor.withValues(alpha: 0.45),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: vm.emailController,
                  ),
                  RecipePasswordFormField(
                    title: "Mobile Number",
                    hintText: "+ 123 456 789",
                    hintStyle: TextStyle(
                      letterSpacing: 5,
                      color: AppColors.beigeColor.withValues(alpha: 0.45),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: vm.phoneNumberController,
                  ),
                  RecipePasswordFormField(
                    title: "Date of birth",
                    hintText: "DD / MM /YYY",
                    hintStyle: TextStyle(
                      letterSpacing: 5,
                      color: AppColors.beigeColor.withValues(alpha: 0.45),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: vm.birthDateController,
                  ),
                  RecipePasswordFormField(
                    title: "Password",
                    hintText: "●●●●●●●",
                    hintStyle: TextStyle(
                      letterSpacing: 5,
                      color: AppColors.beigeColor.withValues(alpha: 0.45),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: vm.passwordController,
                  ),
                  RecipePasswordFormField(
                    title: "Confirm Password",
                    hintText: "●●●●●●●",
                    hintStyle: TextStyle(
                      letterSpacing: 5,
                      color: AppColors.beigeColor.withValues(alpha: 0.45),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: vm.userNameController,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 140),
              child: RecipeElevatedButton(
                text: "Sign up",
                fontSize: 20,
                callback: () async {
                  if (vm.formKey.currentState!.validate()) {
                    if (await vm.register() && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Banzaaay!"),
                        ),
                      );
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Avval ro'yhatdan otgansan !"),
                        ),
                      );
                    }
                  }
                },
                size: Size(70, 45),
              ),
            ),
            SizedBox(height: 27),

          ],
        ),
      ),
    );
  }
}



