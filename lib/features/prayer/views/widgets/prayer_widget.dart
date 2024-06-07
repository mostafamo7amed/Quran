import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/core/utils/providers/cubit/home_view_cubit_cubit.dart';
import 'package:quran/features/prayer/views/widgets/lost_connection.dart';
import 'package:quran/features/prayer/views/widgets/prayer_time_widget.dart';
import 'package:quran/features/prayer/views/widgets/prayer_timer_widget.dart';

class PrayerWidget extends StatelessWidget {
  const PrayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeViewCubitCubit, HomeViewCubitState>(
        listener: (BuildContext context, HomeViewCubitState state) {
          if (state is GetLocationSuccessState) {
            HomeViewCubitCubit.getCubit(context).getPrayerTimes();
          }
          if (state is GetPrayerTimesSuccessState) {
            HomeViewCubitCubit.getCubit(context).time();
          }
        },
        builder: (context, state) {
          var cubit = HomeViewCubitCubit.getCubit(context);
          if (cubit.connectionState == 'none') {
            return const LostConnection();
          } else {
            if (cubit.prayerTime.data != null) {
              return CustomScrollView(
                slivers: [
                  PrayerTimerWidget(
                    cubit: cubit,
                  ),
                  PrayerTimeWidget(
                    cubit: cubit,
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        },
      );
  }
}