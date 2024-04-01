import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/data/constants/colors.dart';
import 'package:quran/data/constants/strings.dart';
import 'package:quran/data/providers/cubit/home_view_cubit_cubit.dart';
import 'package:quran/views/widgets/custom_prayer_widget.dart';
import 'package:slide_countdown/slide_countdown.dart';

import 'widgets/lost_connection.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
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
          return cubit.prayerTime.data != null
            ? CustomScrollView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
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
                                Container(
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    color: ColorData.grey.withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                          cubit
                                              .prayerTime.data!.meta!.timezone!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  color: ColorData.white1)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        Icons.location_on_outlined,
                                        color: ColorData.white1,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  cubit.prayerTime.data == null
                                      ? ""
                                      : cubit.prayerName,
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
                                  duration: Duration(
                                      seconds:
                                          cubit.timeLeftInMilliseconds ~/ 1000),
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
                          ),
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
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: ColorData.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.arrow_back_ios_new,
                                color: ColorData.green,
                              ),
                              const Spacer(),
                              Text(
                                cubit.prayerTime.data!.date!.hijri!.day ?? '1',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                cubit.prayerTime.data!.date!.hijri!.month!.ar ??
                                    "ربيع الثاني",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                '${cubit.prayerTime.data!.date!.hijri!.year} هـ',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: ColorData.green,
                              ),
                            ],
                          ),
                        ),
                        PrayerWidget(
                          time: cubit.prayerTime.data!.timings!.fajr,
                          prayer: StringData.fajr,
                          color: cubit.fl,
                        ),
                        PrayerWidget(
                            time: cubit.prayerTime.data!.timings!.sunrise,
                            prayer: StringData.sunrise,
                            color: cubit.sl),
                        PrayerWidget(
                            time: cubit.prayerTime.data!.timings!.dhuhr,
                            prayer: StringData.dhuhr,
                            color: cubit.dl),
                        PrayerWidget(
                            time: cubit.prayerTime.data!.timings!.asr,
                            prayer: StringData.asr,
                            color: cubit.al),
                        PrayerWidget(
                            time: cubit.prayerTime.data!.timings!.maghrib,
                            prayer: StringData.maghrib,
                            color: cubit.ml),
                        PrayerWidget(
                            time: cubit.prayerTime.data!.timings!.isha,
                            prayer: StringData.isha,
                            color: cubit.il),
                        PrayerWidget(
                          time: cubit.prayerTime.data!.timings!.midnight,
                          prayer: StringData.midnight,
                          color: false,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator());
        }

        
      },
    );
  }
}
