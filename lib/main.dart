import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quran/core/utils/constants/colors.dart';
import 'package:quran/core/utils/providers/cubit/home_view_cubit_cubit.dart';
import 'package:quran/core/utils/providers/observer/bloc_observer.dart';
import 'package:quran/features/prayer/views/home_view.dart';
import 'package:quran/features/prayer/views/widgets/lost_connection.dart';
import 'package:quran/features/quran/view_models/cubit/quran_cubit_cubit.dart';
import 'package:quran/generated/l10n.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeViewCubitCubit()
            ..checkConnection()
            ..getLocation(),
        ),
        BlocProvider(
          create: (context) => QuranCubitCubit()..getSurahList(),
        ),
      ],
      child: MaterialApp(
        title: 'Quran',
        locale: const Locale('en'),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: ColorData.green),
        ),
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
