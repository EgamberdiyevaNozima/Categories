import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_project1/auth/presentation/manager/register_view_model.dart';
import 'package:recipe_app_project1/auth/presentation/pages/register_view.dart';
import 'package:recipe_app_project1/main.dart';
import '../../../core/client.dart';
import '../../../core/colors.dart';
import '../../../core/l10n/app_localizations.dart';
import '../../../onboarding/profile/presentation/widgets/recipe_elevated_button.dart';
import '../../data/repositories/AuthRepository.dart';
import '../manager/login_view_model.dart';
import '../widgets/recipe_password_form_field.dart';
import '../widgets/recipe_text_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
    required this.vm,
  });

  final LoginViewModel vm;

  @override
  Widget build(BuildContext context) {
    final gn =context.watch<LocalizationViewModel>();
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                context.read<LocalizationViewModel>().currentLocale = Locale(
                  "uz",
                );
              },
              child: Text("uz"),
            ),
            TextButton(
              onPressed: () {
                context.read<LocalizationViewModel>().currentLocale = Locale(
                  "en",
                );
              },
              child: Text("en"),
            ),
          ],
          centerTitle: true,
          title: Text(MyLocalizations.of(context)!.login),
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
                    title: MyLocalizations.of(context)!.email,
                    hintText: "example@gmail.com",
                    validator: (value) => null,
                    controller: vm.loginController,
                  ),
                  RecipePasswordFormField(
                    title: MyLocalizations.of(context)!.password,
                    hintText: "●●●●●●●",
                    hintStyle: TextStyle(
                      letterSpacing: 5,
                      color: AppColors.beigeColor.withValues(alpha: 0.45),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: RecipeElevatedButton(
                text: MyLocalizations.of(context)!.login,
                fontSize: 20,
                callback: () async {
                  if (vm.formKey.currentState!.validate()) {
                    if (await vm.login() && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Banzaaay!"),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Avval ro'yhatda ot!"),
                        ),
                      );
                    }
                  }
                },
                size: Size(90, 45),
              ),
            ),
            SizedBox(height: 27),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: RecipeElevatedButton(
                text: "Sing Up",
                fontSize: 20,
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterView(
                        vm: RegisterViewModel(
                          repo: AuthRepository(
                            client: ApiClient(),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                size: Size(90, 45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
