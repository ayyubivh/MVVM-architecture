import 'package:flutter/material.dart';
import 'package:mvvm_sample/components/app_title.dart';
import 'package:provider/provider.dart';

import '../view_models/user_view_models.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Details Screen"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(text: usersViewModel.selectedUser.name!),
            Text(usersViewModel.selectedUser.email!),
          ],
        ),
      ),
    );
  }
}
