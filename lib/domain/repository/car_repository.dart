import 'package:rent_car_app/domain/entities/car.dart';

abstract interface class CarRepository {
  Future<List<Car>> fetchCars();
}
