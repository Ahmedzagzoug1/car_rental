import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

abstract class LocationRemoteDataSource {
 Future<List <PickupLocationModel>> getLocations(carId);
  Future<PickupLocationModel> getCurrentLocation();
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {

  LocationRemoteDataSourceImpl();



@override
  Future<PickupLocationModel> getCurrentLocation() async {
    try{
    final position= await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;


        String locationName = '${place.street}, ${place.locality}';

      return PickupLocationModel(title: place.name!, subtitle: place.street!, price: 200.00, lat: position.latitude,
          lng: position.longitude);
    }
    else{
      throw NotFoundException();
      }
    } catch (e) {
    throw ServerException();
      }
  }

  @override
  Future<List<PickupLocationModel>> getLocations(carId) async {
    final  cars = await FirebaseFirestore.instance
        .collection('car').where('id',isEqualTo: carId).get();
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
    final pickupList = locationsSnapshot.docs
        .map((doc) => PickupLocationModel.fromJson(doc.data()))
        .toList();
    return pickupList;
  }
  }
