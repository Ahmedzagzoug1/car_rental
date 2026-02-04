import 'package:car_rental/features/booking/data/model/host_model.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:hive/hive.dart';
import 'package:car_rental/features/booking/data/data_source/local_data_source/car_details_local_data_source.dart';
import 'package:car_rental/core/error/exceptions.dart';

void main() {
  late Box carDetailsBox;
  late CarDetailsLocalDataSourceImpl localDataSource;

  const tCarId = "car_123";

  setUp(() async {
    await setUpTestHive();
    carDetailsBox = await Hive.openBox('test_box');
    localDataSource = CarDetailsLocalDataSourceImpl(carDetailsBox);
  });

  tearDown(() async {
    await tearDownTestHive();
  });

  group('Host Caching', () {
    final tHostMap = {
      'name': 'Ahmed',
      'star_host': 'Top Host',
      'join_time': DateTime.now().toIso8601String(),
      'trips': 50,
      'image_url': 'url',
      'rate': 4.8,
      'response_time': '15m',
      'phone': '0123456'
    };

    // Assuming HostModel has a fromJson and toJson
    // Using a mock or a real model instance
    final tHostModel = HostModel.fromJson(tHostMap);

    test('should store host data in hive box with correct prefix', () async {
      await localDataSource.cacheHost(tCarId, tHostModel);

      final result = carDetailsBox.get('host_$tCarId');
      expect(result, tHostMap);
    });

    test('should return HostModel from cache when data exists', () async {
      await carDetailsBox.put('host_$tCarId', tHostMap);

      final result = await localDataSource.getCachedHost(tCarId);

      expect(result, isA<HostModel>());
      expect(result?.name, 'Ahmed');
    });

    test('should throw NotFoundException when cache is empty', () async {
      expect(
            () => localDataSource.getCachedHost(tCarId),
        throwsA(isA<NotFoundException>()),
      );
    });
  });

  group('Locations Caching', () {
    final tLocationsList = [
      {'title': 'Airport', 'subtitle': 'Gate 3', 'price': 100.0, 'lat': 1.0, 'lng': 2.0}
    ];

    test('should store locations list in hive', () async {
      final tLocationModels = tLocationsList
          .map((e) => PickupLocationModel.fromJson(e))
          .toList();

      await localDataSource.cacheLocations(tCarId, tLocationModels);

      final result = carDetailsBox.get('locations_$tCarId');
      expect(result, isA<List>());
      expect(result[0]['title'], 'Airport');
    });
  });

  group('Clear Cache', () {
    test('should empty the box when clearCache is called', () async {
      await carDetailsBox.put('some_key', 'some_data');

      await localDataSource.clearCache();

      expect(carDetailsBox.isEmpty, true);
    });
  });
}