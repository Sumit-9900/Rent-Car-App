import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_car_app/core/usecase/usecase.dart';
import 'package:rent_car_app/domain/entities/car.dart';
import 'package:rent_car_app/domain/usecases/fetch_cars.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final FetchCars _fetchCars;
  CarBloc({required FetchCars fetchCars})
      : _fetchCars = fetchCars,
        super(CarInitial()) {
    on<CarEvent>((_, emit) => emit(CarLoading()));
    on<CarLoaded>(_carLoaded);
  }

  void _carLoaded(CarLoaded event, Emitter<CarState> emit) async {
    try {
      final cars = await _fetchCars(NoParams());
      emit(CarSuccess(cars: cars));
    } catch (e) {
      emit(CarError(e.toString()));
    }
  }
}
