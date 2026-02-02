
import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/features/booking/data/model/car_details_model.dart';
import 'package:car_rental/features/booking/data/model/host_model.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/services/service_locators.dart';

abstract class CarDetailsRemoteDataSource{
  Future<HostModel> getHost(carId);
  Future<List<PickupLocationModel>> getLocations(carId);
  Future<CarDetailsModel> getCarDetails(carId);
}
class CarDetailsRemoteDataSourceImpl implements CarDetailsRemoteDataSource{
final  FirebaseFirestore _firebaseFirestore=sl<FirebaseFirestore>();

Future<HostModel> getHost( carId) async {
  try {
    final carDoc= await getCar(carId);
    //get host
    final DocumentReference? hostRef = carDoc['host'] as DocumentReference?;

    if (hostRef == null) throw NotFoundException();

    final hostDoc = await hostRef.get(); // get host from reference

    if (!hostDoc.exists) throw NotFoundException();
final data =hostDoc.data() as Map<String, dynamic>;
    return HostModel.fromJson(data);
  } catch (e) {
    debugPrint("Error in getHost: $e");
    throw NotFoundException();
  }
}
    @override
    Future<List<PickupLocationModel>> getLocations(carId) async {
    debugPrint('get location');
   final carDoc= await getCar(carId);
      final  locationsSnapshot=   await carDoc.reference.collection('pickup_locations')
          .get();
      if(locationsSnapshot.docs.isEmpty){
        debugPrint('locations is Empty');
     throw NotFoundException();
      }
      debugPrint('pickup ${locationsSnapshot.docs.length}');
    final pickupList = locationsSnapshot.docs.map((doc) {
      final data = doc.data();
      debugPrint("Pickup data: $data");
      return PickupLocationModel.fromJson(data);
    }).toList();


    return pickupList;
    }




Future<QueryDocumentSnapshot<Map<String, dynamic>>> getCar(carId) async{
  try {
    final carSnapShot = await _firebaseFirestore.collection('car')
        .where('id', isEqualTo: carId)
        .limit(1)
        .get();

    if (carSnapShot.docs.isEmpty) throw NotFoundException();
    final carDoc = carSnapShot.docs.first;
    return carDoc;

  }catch(e){
    debugPrint("Error in getCar: $e");
    throw NotFoundException();
  }
  }

  @override
  Future<CarDetailsModel> getCarDetails(carId) async {
    try {
      final carDoc = await getCar(carId);

      final data = carDoc.data();
      if (data.isNotEmpty) {
        return CarDetailsModel.fromJson(data);
      }

      throw NotFoundException();
    } catch (e) {
      debugPrint("Error in getCarDetails: $e");
      throw NotFoundException();
    }
  }
}

