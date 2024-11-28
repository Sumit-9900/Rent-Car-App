import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rent_car_app/core/constants/const.dart';
import 'package:rent_car_app/core/utils/show_snackbar.dart';
import 'package:rent_car_app/domain/entities/car.dart';

class MapDetailsPage extends StatelessWidget {
  const MapDetailsPage({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(12.9698, 77.7500),
              initialZoom: 13.0,
              interactionOptions:
                  InteractionOptions(flags: InteractiveFlag.all),
            ),
            children: [openStreetMapTileLayer, markerLayer],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.sizeOf(context).height / 2.5,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black54,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 0, blurRadius: 10)
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      car.model,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
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
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
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
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.sizeOf(context).height / 3.5,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Features',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 1.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        featureTile(
                            Icons.local_gas_station, 'Diesel', 'Common Rail'),
                        featureTile(Icons.speed, 'Acceleration', '0 - 100km/s'),
                        featureTile(Icons.ac_unit, 'Cold', 'Temp Control'),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${car.pricePerHour}/hour',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            showSnackBar(
                              context,
                              'You have booked your vehicle. The vehicle is waiting for you at the pickup location.',
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          child: const Text(
                            'Book Now',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height / 1.6,
            right: 20.0,
            child: Image.asset(whiteCarImage),
          ),
        ],
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer =>
    TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png');

MarkerLayer get markerLayer => const MarkerLayer(
      markers: [
        Marker(
          point: LatLng(12.9698, 77.7600),
          width: 50,
          height: 50,
          alignment: Alignment.center,
          child: Icon(Icons.location_pin, color: Colors.red, size: 50),
        ),
      ],
    );

Widget featureTile(IconData icon, String title, String subtitle) {
  return Container(
    width: 100.0,
    height: 100.0,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 28.0),
        Text(title),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 10),
        ),
      ],
    ),
  );
}
