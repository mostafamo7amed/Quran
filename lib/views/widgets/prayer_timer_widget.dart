import 'package:flutter/material.dart';
import 'package:quran/data/constants/colors.dart';
import 'package:quran/data/constants/strings.dart';
import 'package:quran/data/providers/cubit/home_view_cubit_cubit.dart';
import 'package:quran/views/widgets/location_widget.dart';
import 'package:quran/views/widgets/slideCountdown_widget.dart';

class PrayerTimerWidget extends StatelessWidget {
  const PrayerTimerWidget({super.key, required this.cubit});
  final HomeViewCubitCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.35,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/background.PNG',
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: ColorData.white1,
                      )),
                  const Spacer(),
                  LocationWidget(cubit: cubit),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
            SlideCountdownWidget(cubit: cubit),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '${StringData.nextPrayerTimes}: ${cubit.nextPrayer}',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: ColorData.white1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
