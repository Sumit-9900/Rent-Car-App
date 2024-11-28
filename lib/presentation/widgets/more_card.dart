import 'package:flutter/material.dart';
import 'package:rent_car_app/domain/entities/car.dart';
import 'package:rent_car_app/presentation/pages/car_details_page.dart';

class MoreCard extends StatelessWidget {
  const MoreCard({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff212020),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.model,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Row(
                    children: [
                      const Icon(
                        Icons.directions_car,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        '> ${car.distance} km',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const SizedBox(width: 10.0),
                      const Icon(
                        Icons.battery_full,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        car.fuelCapacity.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => CarDetailsPage(car: car),
                    ),
                  );
                },
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
