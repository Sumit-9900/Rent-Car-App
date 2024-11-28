import 'package:flutter/material.dart';
import 'package:rent_car_app/core/constants/const.dart';
import 'package:rent_car_app/domain/entities/car.dart';
import 'package:rent_car_app/presentation/pages/map_details_page.dart';
import 'package:rent_car_app/presentation/widgets/car_card.dart';
import 'package:rent_car_app/presentation/widgets/more_card.dart';

class CarDetailsPage extends StatefulWidget {
  const CarDetailsPage({super.key, required this.car});

  final Car car;

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation =
        Tween<double>(begin: 1.0, end: 1.5).animate(_animationController!)
          ..addListener(() {
            setState(() {});
          });

    _animationController!.forward();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            Text(' Information'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 5.0),
        child: ListView(
          children: [
            CarCard(car: widget.car),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 170.0,
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
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40.0,
                            backgroundColor: Colors.grey,
                            backgroundImage: AssetImage(userImage),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Sumit Paul',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 3.0),
                          Text(
                            '\$4,253',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => MapDetailsPage(car: widget.car),
                          ),
                        );
                      },
                      child: Container(
                        height: 170.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                              spreadRadius: 5.0,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Transform.scale(
                            scale: _animation!.value,
                            alignment: Alignment.center,
                            child: Image.asset(mapsImage, fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            widget.car.model.contains('-')
                ? Container()
                : Column(
                    children: [
                      const SizedBox(height: 20.0),
                      MoreCard(
                        car: Car(
                          model: '${widget.car.model}-1',
                          distance: widget.car.distance + 100,
                          fuelCapacity: widget.car.fuelCapacity + 50,
                          pricePerHour: widget.car.pricePerHour + 50,
                          imageUrl: widget.car.imageUrl,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      MoreCard(
                        car: Car(
                          model: '${widget.car.model}-2',
                          distance: widget.car.distance + 200,
                          fuelCapacity: widget.car.fuelCapacity + 100,
                          pricePerHour: widget.car.pricePerHour + 100,
                          imageUrl: widget.car.imageUrl,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      MoreCard(
                        car: Car(
                          model: '${widget.car.model}-3',
                          distance: widget.car.distance + 300,
                          fuelCapacity: widget.car.fuelCapacity + 150,
                          pricePerHour: widget.car.pricePerHour + 150,
                          imageUrl: widget.car.imageUrl,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
