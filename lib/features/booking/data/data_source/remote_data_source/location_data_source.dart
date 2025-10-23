import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:car_rental/features/booking/data/model/time_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';

abstract class LocationDataSource {
  Future<void> savePickuplocation(PickupLocationModel location);
  PickupLocationModel? getLocation();
  Future<PickupLocationModel> getCurrentLocation();
}

class LocationLocalDataSourceImpl implements LocationDataSource {
  final Box<PickupLocationModel> box;

  LocationLocalDataSourceImpl({ required this.box});

  static const String key = 'location';

  @override
  PickupLocationModel? getLocation() {
    return box.get(key);
  }

  @override
  Future<void> savePickuplocation(PickupLocationModel location) async {
    await box.put(key, location);
  }

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
  }
