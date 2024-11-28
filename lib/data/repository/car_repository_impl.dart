import 'package:rent_car_app/data/datasources/remote_data_source.dart';
import 'package:rent_car_app/domain/entities/car.dart';
import 'package:rent_car_app/domain/repository/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final RemoteDataSource remoteDataSource;
  CarRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Car>> fetchCars() async {
    try {
      final cars = await remoteDataSource.fetchCars();
      return cars;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
