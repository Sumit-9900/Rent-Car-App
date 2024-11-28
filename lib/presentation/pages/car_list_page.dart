import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_car_app/presentation/bloc/car_bloc.dart';
import 'package:rent_car_app/presentation/pages/car_details_page.dart';
import 'package:rent_car_app/presentation/widgets/car_card.dart';

class CarListPage extends StatefulWidget {
  const CarListPage({super.key});

  @override
  State<CarListPage> createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  @override
  void initState() {
    super.initState();
    context.read<CarBloc>().add(CarLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Car'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          print('State: $state');
          if (state is CarLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is CarError) {
            return Center(child: Text(state.message));
          } else if (state is CarSuccess) {
            final cars = state.cars;
            return ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => CarDetailsPage(car: cars[index]),
                      ),
                    );
                  },
                  child: CarCard(car: cars[index]),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
