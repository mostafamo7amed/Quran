import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/data/providers/observer/bloc_observer.dart';
import 'package:quran/views/home_view.dart';

import 'data/providers/cubit/home_view_cubit_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const Quran());
}

class Quran extends StatelessWidget {
  const Quran({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeViewCubitCubit()..getLocation(),
      child: const MaterialApp(
        title: 'Quran',
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: HomeView()),
      ),
    );
  }
}
