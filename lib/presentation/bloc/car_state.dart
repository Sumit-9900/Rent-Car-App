part of 'car_bloc.dart';

@immutable
sealed class CarState {}

final class CarInitial extends CarState {}

final class CarLoading extends CarState {}

final class CarSuccess extends CarState {
  final List<Car> cars;
  CarSuccess({required this.cars});
}

final class CarError extends CarState {
  final String message;
  CarError(this.message);
}
