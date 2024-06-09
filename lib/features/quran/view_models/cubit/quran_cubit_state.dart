part of 'quran_cubit_cubit.dart';

@immutable
sealed class QuranCubitState {}

final class QuranCubitInitial extends QuranCubitState {}
final class QuranGetSuraState extends QuranCubitState {}
final class QuranGetSuraDetailsState extends QuranCubitState {}