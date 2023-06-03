import 'package:flutter/material.dart';
import 'package:mvvm_sample/user_list/views/user_list_screen.dart';

import '../user_list/views/add_use_screen.dart';

void openUserDetails(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const UserDetailsScreen(),
  ));
}

void openAddUser(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const AddUserScreen(),
  ));
}
