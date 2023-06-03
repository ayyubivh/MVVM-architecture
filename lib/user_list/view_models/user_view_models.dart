import 'package:flutter/material.dart';
import 'package:mvvm_sample/user_list/models/model.dart';
import 'package:mvvm_sample/user_list/repo/user_services.dart';
import '../models/user_error.dart';
import '../repo/api_status.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserListModel> _userListModel = [];
  UserError? _userError;
  bool get loading => _loading;
  UserListModel? _selectedUser;
  UserListModel? _addingUser = UserListModel();

  List<UserListModel> get userListModel => _userListModel;
  UserError? get userError => _userError;
  UserListModel get selectedUser => _selectedUser!;
  UserListModel get addingUser => _addingUser!;
  //============================================================================================================================================================================================
  UsersViewModel() {
    getUsers();
  }

  addUser() async {
    if (!isValid()) {
      return;
    }
    _userListModel.add(addingUser);
    _addingUser = UserListModel();
    notifyListeners();

    return true;
  }

  isValid() {
    if (addingUser.name == null || addingUser.name!.isEmpty) {
      return false;
    }
    if (addingUser.email == null || addingUser.email!.isEmpty) {
      return false;
    }
    return true;
  }

  setSelectedUser(UserListModel userListModel) {
    _selectedUser = userListModel;
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserListModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserListModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.erroResponse.toString(),
      );
      setUserError(userError);
    }
    setLoading(false);
  }

  @override
  String toString() =>
      'UsersViewModel(_loading: $_loading, _userListModel: $_userListModel, _userError: $_userError)';
}
