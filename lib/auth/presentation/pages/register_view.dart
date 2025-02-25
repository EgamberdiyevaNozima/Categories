import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_project1/auth/presentation/manager/register_view_model.dart';
import 'package:recipe_app_project1/core/sizes.dart';
import '../../../core/colors.dart';
import '../../../main.dart';
import '../../../onboarding/profile/presentation/widgets/recipe_elevated_button.dart';
import '../widgets/recipe_password_form_field.dart';

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
                    hintText: "+ 123456789",
                    hintStyle: TextStyle(
                      letterSpacing: 5,
                      color: AppColors.beigeColor.withValues(alpha: 0.45),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: vm.phoneNumberController,
                  ),
                  GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2026),
                      );
                      if (pickedDate != null) {
                        vm.birthDateController.text =
                            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                      }
                    },
                    child: Theme(
                      data: ThemeData(
                        colorScheme: ColorScheme.dark(
                          primary: AppColors.redPinkMain,
                          surface: Colors.white,
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.redPinkMain,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          spacing:10 ,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Date of birth",
                              style: TextStyle(
                                  color: AppColors.redPinkMain,
                                  fontSize: 15,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              alignment:Alignment.centerLeft,
                              height: 48,
                              width: 357,
                              padding: EdgeInsets.only(left:AppSizes.padding36),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: AppColors.pink,
                              ),
                              child: Text(
                                "DD/MM/YYY",
                                style: TextStyle(
                                  color: AppColors.beigeColor.withValues(alpha: 0.5),
                                  fontWeight:FontWeight.w500,
                                  fontSize: 20,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),

                            SizedBox(height: 7),
                          ],
                        ),
                      ),
                    ),
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
          ],
        ),
      ),
    );
  }
}



