import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/bloc/home/home_bloc.dart';
import 'package:movies/bloc/person_info/person_info_bloc.dart';
import 'package:movies/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(),
          ),
          BlocProvider<PersonInfoBloc>(
            create: (_) => PersonInfoBloc(),
          ),
        ],
     child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    ));
  }
}


