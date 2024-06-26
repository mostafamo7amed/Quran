import 'package:flutter/material.dart';
import 'package:quran/core/utils/constants/assets.dart';
import 'package:quran/core/utils/constants/colors.dart';
import 'package:quran/core/utils/constants/strings.dart';
import 'package:quran/core/utils/providers/cubit/home_view_cubit_cubit.dart';
import 'package:quran/features/prayer/views/widgets/location_widget.dart';
import 'package:quran/features/prayer/views/widgets/slideCountdown_widget.dart';

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
              AssetsData.background,
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
