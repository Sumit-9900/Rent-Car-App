import 'package:rent_car_app/core/usecase/usecase.dart';
import 'package:rent_car_app/domain/entities/car.dart';
import 'package:rent_car_app/domain/repository/car_repository.dart';

class FetchCars implements Usecase<List<Car>, NoParams> {
  final CarRepository carRepository;
  FetchCars(this.carRepository);

  @override
  Future<List<Car>> call(NoParams params) async {
    return await carRepository.fetchCars();
  }
}
