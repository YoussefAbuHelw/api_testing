// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:api_testing/Model/user.dart';
//
// import 'cubit/my_cubit.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   User userDetails = User();
//
//   @override
//   void initState() {
//     super.initState();
//     // BlocProvider.of<MyCubit>(context).emitGetUserById("7889555");
//     // BlocProvider.of<MyCubit>(context).emitCreateNewUser(
//     //   User(
//     //     name: 'Youssef Mohamed',
//     //     email: 'Youssef@gmail.com',
//     //     gender: 'male',
//     //     status: 'active',
//     //   ),
//     // );
//     BlocProvider.of<MyCubit>(context).emitDeleteUser("7889554");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home')),
//       body: Column(
//         children: [
//           BlocBuilder<MyCubit, MyState>(
//             builder: (context, state) {
//               if (state is DeleteUser) {
//                 return Container(
//                   height: 50,
//                   color: Colors.amber,
//                   child: Center(child: Text((state.data).toString())),
//                 );
//               } else {
//                 return const Center(child: CircularProgressIndicator());
//               }
//             },
//           ),
//           // ,BlocBuilder<MyCubit, MyState>(
//           //   builder: (context, state) {
//           //     if (state is CreateUser) {
//           //       userDetails = state.newUser;
//           //
//           //       return Container(
//           //         height: 50,
//           //         color: Colors.amber,
//           //         child: Center(child: Text(userDetails.id.toString())),
//           //       );
//           //     } else {
//           //       return const Center(child: CircularProgressIndicator());
//           //     }
//           //   },
//           // ),
//           // BlocBuilder<MyCubit, MyState>(
//           //   builder: (context, state) {
//           //     if (state is GetUser) {
//           //       userDetails = state.userDetails;
//           //
//           //       return Container(
//           //         height: 50,
//           //         color: Colors.amber,
//           //         child: Center(child: Text(userDetails.email.toString())),
//           //       );
//           //     } else {
//           //       return const Center(child: CircularProgressIndicator());
//           //     }
//           //   },
//           // ),
//         ],
//       ),
//     );
//   }
// }

import 'package:api_testing/Model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/my_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> usersList = [];

  // User userDetails = User();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MyCubit>(context).emitGetAllUsers();
    // BlocProvider.of<MyCubit>(context).emitGetUserById("7889569");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          BlocBuilder<MyCubit, MyState>(
            builder: (context, state) {
              if (state is GetUsers) {
                usersList = (state).users.cast<User>();
                return ListView.builder(
                  itemCount: usersList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      height: 50,
                      color: Colors.amber,
                      child: Center(
                        child: Text(usersList[index].name.toString()),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          // BlocBuilder<MyCubit, MyState>(
          //   builder: (context, state) {
          //     if (state is GetUser) {
          //       userDetails = (state).userDetails as User;
          //
          //       return Container(
          //         height: 50,
          //         color: Colors.amber,
          //         child: Center(child: Text(userDetails.name.toString())),
          //       );
          //     } else {
          //       return const Center(child: CircularProgressIndicator());
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
