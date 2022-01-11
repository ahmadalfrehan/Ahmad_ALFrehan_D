import 'package:ahmad_alfrehan/Homep.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit/Cubitfile.dart';
import 'Cubit/Status.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /*MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..createDatabase(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, AppStates state) {},
        builder: (context, AppStates state) {
          return*/
        MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeP(),
    );
  }
}
