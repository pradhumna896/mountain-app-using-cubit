import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mountain_app/cubit/app_cubit.dart';
import 'package:mountain_app/cubit/app_cubit_logics.dart';
import 'package:mountain_app/model/data_model.dart';
import 'package:mountain_app/pages/detail_page.dart';
import 'package:mountain_app/pages/welcome_page.dart';
import 'package:mountain_app/service/data_service.dart';

void main() {
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
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: ((context) =>AppCubits(
          data:DataServices()
        )),
        child: AppCubitLogics()
        ),
    );
  }
}
