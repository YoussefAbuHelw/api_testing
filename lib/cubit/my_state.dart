part of 'my_cubit.dart';

@immutable
abstract class MyState {}

class MyInitial extends MyState {}

class GetUsers extends MyState {
  final List<User> users;

  GetUsers(this.users);
}

class GetUser extends MyState {
  final User userDetails;

  GetUser(this.userDetails);
}

class CreateUser extends MyState {
  final User newUser;

  CreateUser(this.newUser);
}

class DeleteUser extends MyState {
  final dynamic data;

  DeleteUser(this.data);
}
