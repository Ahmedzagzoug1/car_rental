import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/features/booking/data/data_source/remote_data_source/car_details_remote_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  late FakeFirebaseFirestore fakeFirestore;
  late CarDetailsRemoteDataSourceImpl dataSource;

  setUp(() {
    fakeFirestore = FakeFirebaseFirestore();
    dataSource = CarDetailsRemoteDataSourceImpl(firebaseFirestore: fakeFirestore);
  });
String tCarId='car33';
  test('It must return hostModel if HostModel is a Ref', () async {
    //build host object
    final hostRef = await fakeFirestore.collection('users').add({
      'name': 'Ahmed',
      'star_host': 'Top Host',
      'createdAt': Timestamp.now(),
      'trips': 50,
      'image_url': 'https://example.com/image.png',
      'rate': 4.8,
      'response_time': '15 mins',
      'phone': '0123456789',
    });
//add host to car
    await fakeFirestore.collection('car').add({
      'id': tCarId,
      'host': hostRef,
    });

    // execute
    final result = await dataSource.getHost(tCarId);
    //expect
    expect(result.name, 'Ahmed');
    expect(result.trips, 50);
  });
  test('must return a list of PickupLocationModel', () async {
    //car field
    final carDocRef = await fakeFirestore.collection('car').add({
      'id': tCarId,
    });

    // pickup_locations
        await carDocRef.collection('pickup_locations').add({
      'title': 'Cairo Airport',
      'subtitle': 'Terminal 3',
      'price': 150.0,
      'lat': 30.121,
      'lng': 31.405,
    });

    //execute
    final result = await dataSource.getLocations(tCarId);

    // expect
    expect(result.length, 1);
    expect(result.first.title, 'Cairo Airport');
  });


    test('it must throw Exception', () async {
      // Act & Assert
      expect(
            () => dataSource.getCarDetails('wrong_id'),
        throwsA(isA<NotFoundException>()),
      );
    });


}