part of 'car_bloc.dart';

@immutable
sealed class CarEvent {}

final class CarLoaded extends CarEvent {}
