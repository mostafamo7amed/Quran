import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/data/constants/colors.dart';
import 'package:quran/data/providers/cubit/home_view_cubit_cubit.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeViewCubitCubit, HomeViewCubitState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = HomeViewCubitCubit.getCubit(context);
          return Scaffold(
            body: cubit.screens[cubit.currentWidgetIndex],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: ColorData.green,
              unselectedIconTheme: const IconThemeData(color: ColorData.grey),
              selectedIconTheme: const IconThemeData(color: ColorData.green),
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              currentIndex: cubit.currentWidgetIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/ic_praying.png')),
                    label: 'Prayer'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/ic_quran.png')),
                    label: 'Quran'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/images/ic_compass.png')),
                    label: 'Compass'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Setting'),
              ],
            ),
          );
        },
      ),
    );
  }
}
