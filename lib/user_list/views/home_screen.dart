import 'package:flutter/material.dart';
import 'package:mvvm_sample/components/app_loading.dart';
import 'package:mvvm_sample/components/user_list_row.dart';
import 'package:mvvm_sample/user_list/models/model.dart';
import 'package:mvvm_sample/user_list/view_models/user_view_models.dart';
import 'package:mvvm_sample/utils/navigatios.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Users'),
      ),
      body: _ui(usersViewModel),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openAddUser(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return const Center(
        child: AppLoading(),
      );
    }
    if (usersViewModel.userError != null) {
      return Container();
    }
    return ListView.separated(
      itemCount: usersViewModel.userListModel.length,
      itemBuilder: (context, index) {
        UserListModel userListModel = usersViewModel.userListModel[index];
        return UserListRow(
          userListModel: userListModel,
          onTap: () {
            usersViewModel.setSelectedUser(userListModel);
            openUserDetails(context);
          },
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
