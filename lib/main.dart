import 'package:final_countdown/app/home/bloc/home_bloc.dart';
import 'package:final_countdown/app/home/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/home': (_) => BlocProvider(
              create: (_) => HomeBloc(),
              child: const HomePage(),
            )
      },
      initialRoute: '/home',
    );
  }
}
