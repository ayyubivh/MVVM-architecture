// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/user_view_models.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Add Users'),
        actions: [
          IconButton(
              onPressed: () async {
                bool userAdded = await usersViewModel.addUser();
                if (!userAdded) {
                  return;
                }
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "Name"),
              onChanged: (value) async {
                usersViewModel.addingUser.name = value;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(hintText: "Email"),
              onChanged: (value) async {
                usersViewModel.addingUser.email = value;
              },
            )
          ],
        ),
      ),
    );
  }
}
