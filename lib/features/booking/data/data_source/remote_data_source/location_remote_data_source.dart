import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/core/services/service_locators.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:car_rental/features/booking/data/model/time_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';

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

        print('🏠 المكان: ${place.name}');
        print('📍 الشارع: ${place.street}');
        print('🏙️ المدينة: ${place.locality}');
        print('🌆 المحافظة: ${place.administrativeArea}');
        print('🌍 الدولة: ${place.country}');

        // مثال لو عايز اسم مختصر
        String locationName = '${place.street}, ${place.locality}';
        print('📌 الموقع الكامل: $locationName');

      return PickupLocationModel(title: place.name!, subtitle: place.street!, price: '200 eg', lat: position.latitude,
          lng: position.longitude);
    }
    else{
      throw NotFoundException();
      }
    } catch (e) {
      print('❌ خطأ أثناء جلب اسم المكان: $e');
    throw ServerException();
      }
  }

  @override
  Future<List<PickupLocationModel>> getLocations(carId) async{
    final carDoc = await FirebaseFirestore.instance
        .collection('cars')
        .doc(carId)
        .get();

    if (!carDoc.exists) {
      print('❌ Car not found');
      return [];
    }

    final List locationRefs = carDoc['pickupLocations'];

    List<PickupLocationModel> locations = [];

    for (var ref in locationRefs) {
      if (ref is DocumentReference) {
        final locationDoc = await ref.get();
        if (locationDoc.exists) {
          locations.add( PickupLocationModel.fromJson( locationDoc.data() as Map<String,dynamic>));
        }
      }
    }

    // عرض النتيجة
    for (var loc in locations) {

      print('📍 Location: ${loc.title}' );
    }
    return locations;
  }
  }
