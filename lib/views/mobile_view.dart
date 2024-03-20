import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/data/providers/cubit/home_view_cubit_cubit.dart';
import 'package:quran/views/widgets/custom_prayer_widget.dart';
import 'package:slide_countdown/slide_countdown.dart';

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

        return cubit.prayerTime.data != null
            ? CustomScrollView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height * 0.4,
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
                                      Icons.settings,
                                      color: Colors.white,
                                    )),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.white,
                                    )),
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
                                      .copyWith(color: Colors.white),
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
                                      .copyWith(color: Colors.white),
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  duration: Duration(seconds: 
                                   cubit.timeLeftInMilliseconds ~/ 1000),
                                ),
                                Text(
                                  'الوقت المتبقي',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                'موعد الصلاة القادمة: ${cubit.nextPrayer}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white),
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
                        PrayerWidget(
                            time: cubit.prayerTime.data!.timings!.fajr,
                            prayer: 'الفجر'),
                        PrayerWidget(
                            time: cubit.prayerTime.data!.timings!.sunrise,
                            prayer: 'الشروق'),
                        PrayerWidget(
                            time: cubit.prayerTime.data!.timings!.dhuhr,
                            prayer: 'الظهر'),
                        PrayerWidget(
                            time: cubit.prayerTime.data!.timings!.asr,
                            prayer: 'العصر'),
                        PrayerWidget(
                            time: cubit.prayerTime.data!.timings!.maghrib,
                            prayer: 'المغرب'),
                        PrayerWidget(
                            time: cubit.prayerTime.data!.timings!.isha,
                            prayer: 'العشاء'),
                        PrayerWidget(
                            time: cubit.prayerTime.data!.timings!.midnight,
                            prayer: "قيام الليل"),
                      ],
                    ),
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }

  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}
