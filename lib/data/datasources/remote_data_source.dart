import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_car_app/data/models/car_model.dart';

abstract interface class RemoteDataSource {
  Future<List<CarModel>> fetchCars();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseFirestore firestore;
  RemoteDataSourceImpl(this.firestore);

  @override
  Future<List<CarModel>> fetchCars() async {
    try {
      final snapshot = await firestore.collection('cars').get();
      return snapshot.docs.map((doc) => CarModel.fromJson(doc.data())).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
