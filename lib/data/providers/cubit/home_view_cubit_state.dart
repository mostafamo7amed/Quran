part of 'home_view_cubit_cubit.dart';

@immutable
sealed class HomeViewCubitState {}

final class HomeViewCubitInitial extends HomeViewCubitState {}
final class GetLocationSuccessState extends HomeViewCubitState {}
final class GetPrayerTimesSuccessState extends HomeViewCubitState {}
final class SetNextPrayerTimesSuccessState extends HomeViewCubitState {}
final class SetCountdownTimesSuccessState extends HomeViewCubitState {}
final class SetTimeleftSuccessState extends HomeViewCubitState {}

