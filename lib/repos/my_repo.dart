import 'package:api_testing/Model/user.dart';

import '../services/web_services.dart';

class MyRepo {
  final WebServices webServices;

  MyRepo(this.webServices);

  Future<List<User>> getAllUsers() async {
    return await webServices.getAllUsers();
  }

  Future<User> getUserById(String userId) async {
    return await webServices.getUserById(userId);
  }

  Future<User> createNewUser(User newUser) async {
    return await webServices.createNewUser(
      newUser,
      'Bearer 3b4ded552d382f3262cc6f49657cb8f8db22b67195c71f6ff9279884e783fe9d',
    );
  }

  Future<dynamic> deleteUser(String id) async {
    return await webServices.deleteUser(
      id,
      'Bearer 3b4ded552d382f3262cc6f49657cb8f8db22b67195c71f6ff9279884e783fe9d',
    );
  }
}
