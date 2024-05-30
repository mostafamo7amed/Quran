import 'package:flutter/material.dart';
import 'package:quran/data/constants/colors.dart';
import 'package:quran/data/constants/strings.dart';
import 'package:quran/data/providers/cubit/home_view_cubit_cubit.dart';
import 'package:slide_countdown/slide_countdown.dart';

class SlideCountdownWidget extends StatefulWidget {
  const SlideCountdownWidget({super.key, required this.cubit});
  final HomeViewCubitCubit cubit;
  @override
  State<SlideCountdownWidget> createState() => _SlideCountdownWidgetState();
}

class _SlideCountdownWidgetState extends State<SlideCountdownWidget> {
  @override
  Widget build(BuildContext context) {
    var cubit = widget.cubit;
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            cubit.prayerTime.data == null ? "" : cubit.prayerName,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: ColorData.white1),
          ),
          SlideCountdown(
            onDone: () {
              setState(() {
                cubit.time();
              });
            },
            shouldShowDays: (_) => false,
            showZeroValue: true,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: ColorData.white1),
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            duration: Duration(seconds: cubit.timeLeftInMilliseconds ~/ 1000),
          ),
          Text(
            StringData.remainingTime,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: ColorData.white1),
          ),
        ],
      ),
    );
  }
}
