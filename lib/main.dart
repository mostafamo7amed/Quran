import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/data/providers/observer/bloc_observer.dart';
import 'package:quran/views/home_view.dart';
import 'package:quran/views/widgets/lost_connection.dart';

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
      create: (context) => HomeViewCubitCubit()
        ..checkConnection()
        ..getLocation(),
      child: MaterialApp(
        title: 'Quran',
        debugShowCheckedModeBanner: false,
        home: StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              return snapshot.data != ConnectivityResult.none
                  ? const SafeArea(child: HomeView())
                  : const LostConnection();
            }),
      ),
    );
  }
}
