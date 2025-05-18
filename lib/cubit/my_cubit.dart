import 'package:api_testing/Model/user.dart';
import 'package:bloc/bloc.dart';
import "package:meta/meta.dart";

import '../repos/my_repo.dart';

part 'my_state.dart';

class MyCubit extends Cubit<MyState> {
  final MyRepo myRepo;

  MyCubit(this.myRepo) : super(MyInitial());

  void emitGetAllUsers() {
    myRepo.getAllUsers().then((users) {
      emit(GetUsers(users.cast<User>()));
    });
  }

  void emitGetUserById(String userId) {
    myRepo.getUserById(userId).then((userDetails) {
      emit(GetUser(userDetails));
    });
  }

  void emitCreateNewUser(User newUser) {
    myRepo.createNewUser(newUser).then((NewUser) {
      emit(CreateUser(NewUser));
    });
  }

  void emitDeleteUser(String id) {
    myRepo.deleteUser(id).then((data) {
      emit(DeleteUser(data));
    });
  }
}
