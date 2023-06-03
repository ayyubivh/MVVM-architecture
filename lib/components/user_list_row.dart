import 'package:flutter/material.dart';
import 'package:mvvm_sample/user_list/models/model.dart';

import 'app_title.dart';

class UserListRow extends StatelessWidget {
  final UserListModel userListModel;
  final VoidCallback onTap;
  const UserListRow(
      {super.key, required this.userListModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppTitle(text: userListModel.name.toString()),
          Text(userListModel.email.toString()),
        ]),
      ),
    );
  }
}
