import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/routing/routes.dart';
import '../../data/repositories/auth_repository.dart';
import '../widgets/show_dialog.dart';

class SignUpViewModel extends ChangeNotifier {
  SignUpViewModel({required AuthRepository authRepo}) : _authRepo = authRepo;
  final AuthRepository _authRepo;
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  void set selectedDate(DateTime? value) {
    _selectedDate = value ?? _selectedDate;
    notifyListeners();
  }

  Future signUp(BuildContext context) async {
    final result = await _authRepo.signUp(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      username: userNameController.text,
      email: emailController.text,
      phoneNumber: phoneNumberController.text,
      dateOfBirth: selectedDate!,
      password: passwordController.text,
    );

    if (formKey.currentState!.validate()) {
      if (result && context.mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => ShowDialogPicker(),
        );
        await Future.delayed(Duration(seconds: 3));

        context.go(Routes.onboarding);
      }
    }
  }
}
