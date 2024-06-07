import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quran/core/utils/constants/strings.dart';
import 'package:quran/features/prayer/views/widgets/compase_widget.dart';
import 'package:quran/features/prayer/views/widgets/prayer_widget.dart';
import 'package:quran/features/quran/views/quran_widget.dart';
import 'package:quran/features/prayer/views/widgets/setting_widget.dart';
import '../../models/prayer_time_model.dart' as model;
import 'package:location/location.dart';
import 'package:quran/core/utils/network/request.dart';

part 'home_view_cubit_state.dart';

class HomeViewCubitCubit extends Cubit<HomeViewCubitState> {
  HomeViewCubitCubit() : super(HomeViewCubitInitial());

  static HomeViewCubitCubit getCubit(context) => BlocProvider.of(context);


  int currentWidgetIndex = 0;

  List<Widget> screens = [
    const PrayerWidget(),
    const QuranWidget(),
    const CompaseWidget(),
    const SettingWidget(),
  ];

  void changeBottomNav(int index) {
    currentWidgetIndex = index;
    emit(ChengeBottomNavState());
  }
  double longitude = 0;
  double latitude = 0;
  String location = '';
  double timeLeftInMilliseconds = 0;
  model.PrayerTime prayerTime = model.PrayerTime();
  String nextPrayer = '00:00';
  String prayerName = 'Fajr';
  bool sl = false;
  bool fl = false;
  bool dl = false;
  bool al = false;
  bool ml = false;
  bool il = false;
  var connectionState = 'none';

  void checkConnection() async {
    var result = await Connectivity().checkConnectivity();
    connectionState = result.name;
    emit(CheckConnectionState());
  }

  getPrayerTimes() async {
    final now = DateTime.now();
    String currentDate = DateFormat('dd-MM-yyyy').format(now);
    prayerTime =
        await getPrayerTime(date: currentDate, lat: latitude, long: longitude);
    emit(GetPrayerTimesSuccessState());
  }

  Future getLocation() async {
    final Location locationController = Location();
    bool serviceEnabled;
    PermissionStatus premissionGranted;
    serviceEnabled = await locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return;
    }

    premissionGranted = await locationController.hasPermission();
    if (premissionGranted == PermissionStatus.denied) {
      premissionGranted = await locationController.requestPermission();
      if (premissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationController.getLocation().then((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        latitude = currentLocation.latitude!;
        longitude = currentLocation.longitude!;
        location = currentLocation.provider!;
        emit(GetLocationSuccessState());
      }
    });
  }

  void time() {
    String f = prayerTime.data!.timings!.fajr!;
    String s = prayerTime.data!.timings!.sunrise!;
    String d = prayerTime.data!.timings!.dhuhr!;
    String a = prayerTime.data!.timings!.asr!;
    String i = prayerTime.data!.timings!.isha!;
    String m = prayerTime.data!.timings!.maghrib!;
    DateFormat sdf = DateFormat("HH:mm");
    String str = sdf.format(DateTime.now());

    double minutes = double.parse(str.substring(3, 5));
    double hours = double.parse(str.substring(0, 2));
    double currentTime = (hours * 60 * 60 + minutes * 60) * 1000;

    double fh = double.parse(f.substring(0, 2));
    double fm = double.parse(f.substring(3, 5));
    double fajrTime = (fh * 60 * 60 + fm * 60) * 1000;

    double sh = double.parse(s.substring(0, 2));
    double sm = double.parse(s.substring(3, 5));
    double sunTime = (sh * 60 * 60 + sm * 60) * 1000;

    double dh = double.parse(d.substring(0, 2));
    double dm = double.parse(d.substring(3, 5));
    double duhrTime = (dh * 60 * 60 + dm * 60) * 1000;

    double ah = double.parse(a.substring(0, 2));
    double am = double.parse(a.substring(3, 5));
    double asrTime = (ah * 60 * 60 + am * 60) * 1000;

    double mh = double.parse(m.substring(0, 2));
    double mm = double.parse(m.substring(3, 5));
    double magrTime = (mh * 60 * 60 + mm * 60) * 1000;

    double ih = double.parse(i.substring(0, 2));
    double im = double.parse(i.substring(3, 5));
    double ishaTime = (ih * 60 * 60 + im * 60) * 1000;

    if (currentTime >= 0 && currentTime <= fajrTime ||
        currentTime >= ishaTime) {
      //86400000 = 24:00:00
      timeLeftInMilliseconds = fajrTime + (86400000 - currentTime);
      emit(SetCountdownTimesSuccessState());
      nextPrayer = f;
      prayerName = StringData.fajr;
      fl = true;
      emit(SetNextPrayerTimesSuccessState());
    } else if (currentTime >= fajrTime && currentTime <= sunTime) {
      timeLeftInMilliseconds = sunTime - currentTime;
      emit(SetCountdownTimesSuccessState());
      nextPrayer = s;
      prayerName = StringData.sunrise;
      sl = true;
      emit(SetNextPrayerTimesSuccessState());
    } else if (currentTime >= sunTime && currentTime <= duhrTime) {
      timeLeftInMilliseconds = duhrTime - currentTime;
      emit(SetCountdownTimesSuccessState());
      nextPrayer = d;
      prayerName = StringData.dhuhr;
      dl = true;
      emit(SetNextPrayerTimesSuccessState());
    } else if (currentTime >= duhrTime && currentTime <= asrTime) {
      timeLeftInMilliseconds = asrTime - currentTime;
      emit(SetCountdownTimesSuccessState());
      nextPrayer = a;
      prayerName = StringData.asr;
      al = true;
      emit(SetNextPrayerTimesSuccessState());
    } else if (currentTime >= asrTime && currentTime <= magrTime) {
      timeLeftInMilliseconds = magrTime - currentTime;
      emit(SetCountdownTimesSuccessState());
      nextPrayer = m;
      prayerName = StringData.maghrib;
      ml = true;
      emit(SetNextPrayerTimesSuccessState());
    } else if (currentTime >= magrTime) {
      timeLeftInMilliseconds = ishaTime - currentTime;
      emit(SetCountdownTimesSuccessState());
      nextPrayer = i;
      prayerName = StringData.isha;
      il = true;
      emit(SetNextPrayerTimesSuccessState());
    }
  }
}
