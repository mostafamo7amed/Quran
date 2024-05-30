import 'package:flutter/material.dart';
import 'package:quran/data/constants/strings.dart';
import 'package:quran/data/providers/cubit/home_view_cubit_cubit.dart';
import 'package:quran/views/widgets/custom_prayer_widget.dart';
import 'package:quran/views/widgets/hijri_data_widget.dart';

class PrayerTimeWidget extends StatelessWidget {
  const PrayerTimeWidget({super.key, required this.cubit});
  final HomeViewCubitCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          HijriData(
              day: cubit.prayerTime.data!.date!.hijri!.day,
              month: cubit.prayerTime.data!.date!.hijri!.month!.ar,
              year: cubit.prayerTime.data!.date!.hijri!.year),
          CustomPrayerWidget(
            time: cubit.prayerTime.data!.timings!.fajr,
            prayer: StringData.fajr,
            color: cubit.fl,
          ),
          CustomPrayerWidget(
              time: cubit.prayerTime.data!.timings!.sunrise,
              prayer: StringData.sunrise,
              color: cubit.sl),
          CustomPrayerWidget(
              time: cubit.prayerTime.data!.timings!.dhuhr,
              prayer: StringData.dhuhr,
              color: cubit.dl),
          CustomPrayerWidget(
              time: cubit.prayerTime.data!.timings!.asr,
              prayer: StringData.asr,
              color: cubit.al),
          CustomPrayerWidget(
              time: cubit.prayerTime.data!.timings!.maghrib,
              prayer: StringData.maghrib,
              color: cubit.ml),
          CustomPrayerWidget(
              time: cubit.prayerTime.data!.timings!.isha,
              prayer: StringData.isha,
              color: cubit.il),
          CustomPrayerWidget(
            time: cubit.prayerTime.data!.timings!.midnight,
            prayer: StringData.midnight,
            color: false,
          ),
        ],
      ),
    );
  }
}
