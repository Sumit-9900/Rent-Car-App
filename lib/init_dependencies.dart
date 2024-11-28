import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:rent_car_app/data/datasources/remote_data_source.dart';
import 'package:rent_car_app/data/repository/car_repository_impl.dart';
import 'package:rent_car_app/domain/repository/car_repository.dart';
import 'package:rent_car_app/domain/usecases/fetch_cars.dart';
import 'package:rent_car_app/presentation/bloc/car_bloc.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);

  getIt.registerFactory<RemoteDataSource>(() => RemoteDataSourceImpl(getIt()));

  getIt.registerFactory<CarRepository>(() => CarRepositoryImpl(getIt()));

  getIt.registerFactory(() => FetchCars(getIt()));

  getIt.registerLazySingleton(() => CarBloc(fetchCars: getIt()));
}
