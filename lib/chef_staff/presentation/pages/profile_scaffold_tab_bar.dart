import 'package:flutter/material.dart';
import '../../../client.dart';
import '../../data/repositories/chef_staff_repository.dart';
import '../widgets/chef_staff_body.dart';
import 'chef_staff_view_model.dart';

class ProfileScaffoldTabBar extends StatelessWidget {
  const ProfileScaffoldTabBar({super.key, required this.vm});

  final ChefStaffViewModel vm;

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      Center(
        child: ChefStaffBody(
          vm: ChefStaffViewModel(
            repo: ChefStaffRepository(
              client: ApiClient(),
            ),
          ),
        ),
      ),
      Center(
        child:  ChefStaffBody(
          vm: ChefStaffViewModel(
            repo: ChefStaffRepository(
              client: ApiClient(),
            ),
          ),
        ),
      )
    ]);
  }
}
