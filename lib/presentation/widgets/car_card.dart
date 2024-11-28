import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rent_car_app/core/constants/const.dart';
import 'package:rent_car_app/domain/entities/car.dart';

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xffF3F3F3),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: car.imageUrl,
            fit: BoxFit.cover,
            placeholder: (context, url) {
              return const SizedBox(height: 100);
            },
          ),
          Text(
            car.model,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(gpsImage),
                  Text(' ${car.distance.toStringAsFixed(0)}km'),
                ],
              ),
              Row(
                children: [
                  Image.asset(pumpImage),
                  Text(' ${car.fuelCapacity.toStringAsFixed(0)}L'),
                ],
              ),
              Text(
                '\$${car.pricePerHour.toStringAsFixed(2)}/h',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
