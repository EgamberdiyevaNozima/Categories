import 'package:flutter/material.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/AuthRepository.dart';

class RegisterViewModel extends ChangeNotifier {
  RegisterViewModel({required AuthRepository repo}) : _repo = repo;
  final AuthRepository _repo;

  String? _errorMessage;

  bool get hasError => _errorMessage != null;

  String? get errorMessage => _errorMessage;

  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();


  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final birthDateController = TextEditingController();
  final passwordController = TextEditingController();


  Future<bool> register() async {
    try {
      await _repo.register(UserModel(username: userNameController.text,
          fullName: fullNameController.text,
          email: emailController.text,
          birthDate: birthDateController.text,
          password: passwordController.text,
          phoneNumber: phoneNumberController.text),);
    } on Exception catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }

    _errorMessage = null;
    notifyListeners();
    return true;
  }
}
