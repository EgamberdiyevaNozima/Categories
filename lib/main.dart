import 'package:flutter/material.dart';
import 'package:recipe_app_project1/chef_staff/data/repositories/chef_staff_repository.dart';
import 'package:recipe_app_project1/chef_staff/presentation/pages/chef_staff_view.dart';
import 'package:recipe_app_project1/chef_staff/presentation/pages/chef_staff_view_model.dart';
import 'client.dart';
import 'core/sizes.dart';
import 'onboarding/data/repositories/onboarding_page_repository.dart';
import 'onboarding/presentation/manager/onboarding_page_view_model.dart';
import 'onboarding/presentation/pages/onboarding_view.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChefStaffView(vm: ChefStaffViewModel(repo: ChefStaffRepository(client: ApiClient()))),
    );
  }
}
