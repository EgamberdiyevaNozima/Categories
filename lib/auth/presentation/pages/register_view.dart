import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/colors.dart';
import '../../../profile/presentation/widgets/recipe_elevated_button.dart';
import '../manager/login_view_model.dart';
import '../manager/register_view_model.dart';
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
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Sign up",
            style: TextStyle(
                color: AppColors.redPinkMain,
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600),
          ),
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
                    hintText: "example@gmail.com",
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
                    } else {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) => SimpleDialog(
                          backgroundColor: Colors.white,
                          title: Center(
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Succesful!",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          ),
                          contentPadding: EdgeInsets.all(20),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            color: AppColors.pink,
                                            height: 82,
                                            width: 82,
                                          ),
                                          SvgPicture.asset(
                                            'assets/icons/profile.svg',
                                            height: 40,
                                            width: 40,
                                            color: Colors.red,
                                          ),
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Lorem ipsum dolor sit amet ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "pretium cras id dui",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "pellentesque ornare.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "Quisque malesuada.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
                size: Size(70, 45),
              ),
            ),
            // SizedBox(height: 27),
          ],
        ),
      ),
    );
  }
}
