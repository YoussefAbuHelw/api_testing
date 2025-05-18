import 'package:api_testing/cubit/my_cubit.dart';
import 'package:api_testing/home_screen.dart';
import 'package:api_testing/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      home:   BlocProvider(
        create: (context) => getIt<MyCubit>(),
        child: HomeScreen(),
      ),
      // home: HomeScreen(),
    );
  }
}
