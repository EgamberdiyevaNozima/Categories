import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app_project1/login/presentation/widgets/show_dialog.dart';

import '../../../core/l10n/app_localizations.dart';
import '../manager/sign_up_viewmodel.dart';
import 'login_elevated_button.dart';

class signup_button extends StatelessWidget {
  const signup_button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return login_elevated_button(
      text: MyLocalizations.of(context)!.signUp,
      callback: () async {
        if (context.read<SignUpViewModel>().formKey.currentState!.validate()) {
          if (await context.read<SignUpViewModel>().signUp(context) &&
              context.mounted) {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: ShowDialogPicker(),
              ),
            );
          }
        }
      },
    );
  }
}