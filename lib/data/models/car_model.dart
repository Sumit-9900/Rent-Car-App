import 'package:rent_car_app/domain/entities/car.dart';

class CarModel extends Car {
  CarModel({
    required super.model,
    required super.distance,
    required super.fuelCapacity,
    required super.pricePerHour,
    required super.imageUrl,
  });

  factory CarModel.fromJson(Map<String, dynamic> map) {
    return CarModel(
      model: map['model'] as String,
      distance: map['distance'] as int,
      fuelCapacity: map['fuelCapacity'] as int,
      pricePerHour: map['pricePerHour'] as int,
      imageUrl: map['imageUrl'] as String,
    );
  }
}
