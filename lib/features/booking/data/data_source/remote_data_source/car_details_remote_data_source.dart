
import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/features/booking/data/model/host_model.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../core/services/service_locators.dart';

abstract class CarDetailsRemoteDataSource{
  Future<HostModel> getHost(carId);
  Future<List<PickupLocationModel>> getLocations(carId);
}
class CarDetailsRemoteDataSourceImpl implements CarDetailsRemoteDataSource{
final  FirebaseFirestore _firebaseFirestore=sl<FirebaseFirestore>();
  @override
  Future<HostModel> getHost( carId)async {
    try {
      final carSnapShot = await _firebaseFirestore.collection('car').where(
          'id', isEqualTo: carId).get();
      final car = carSnapShot.docs.first;
print('${car} source');
      final DocumentReference hostRef = car['host'];
      final hostId = hostRef.id;
      final hostDoc = await _firebaseFirestore
          .collection('users')
          .doc(hostId)
          .get();
      final data = hostDoc.data();
      print('Host data: $data');
      final hostModel = HostModel.fromJson(hostDoc.data()!);
      return hostModel;
    } catch (e) {
      throw NotFoundException();
    }
  }
    @override
    Future<List<PickupLocationModel>> getLocations(carId) async {
    print('get location');
    print('${carId} location');
      final  cars = await FirebaseFirestore.instance
          .collection('car').where('id',isEqualTo: carId).get();
    print('cars found = ${cars.docs.length}');
      if(cars.docs.isEmpty){
        return [];
      }
      final carDoc=cars.docs.first;
      if(!carDoc.exists){
        print('car Not found!!!');
        return[];
      }
      final  locationsSnapshot=   await carDoc.reference.collection('pickup_locations')
          .get();
      if(locationsSnapshot.docs.isEmpty){
        print('locations is Empty');
        return[];
      }
      print('pickup ${locationsSnapshot.docs.length}');
    final pickupList = locationsSnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      print("Pickup data: $data");
      return PickupLocationModel.fromJson(data);
    }).toList();

      /*
      final pickupList = locationsSnapshot.docs
          .map((doc) => PickupLocationModel.fromJson(doc.data()))
          .toList();
    for (var d in locationsSnapshot.docs) {
      print('${d.data()} data ');
    }
print('${pickupList.length} pickup length');
      */
    return pickupList;
    }




  /*@override
  Future<dynamic> getCar(carId) {
    // TODO: implement getCar
    throw UnimplementedError();
  }*/

}