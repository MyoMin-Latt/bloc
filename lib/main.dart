import 'package:bloc_pattern/api_page.dart';
import 'package:bloc_pattern/bloc/api_bloc.dart';
import 'package:bloc_pattern/bloc/counter_bloc.dart';
import 'package:bloc_pattern/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => ApiBloc(),
        child: const ApiPage(),
      ),
    );
  }
}
