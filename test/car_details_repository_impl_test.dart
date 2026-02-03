import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/features/booking/data/data_source/local_data_source/car_details_local_data_source.dart';
import 'package:car_rental/features/booking/data/data_source/remote_data_source/car_details_remote_data_source.dart';
import 'package:car_rental/features/booking/data/model/car_details_model.dart';
import 'package:car_rental/features/booking/data/model/host_model.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:car_rental/features/booking/data/repositories/car_details_repository_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';

import 'car_details_repository_impl_test.mocks.dart';

@GenerateMocks([CarDetailsRemoteDataSource, CarDetailsLocalDataSource])
void main() {
  late CarDetailsRepositoryImpl repository;
  late MockCarDetailsRemoteDataSource mockRemoteDataSource;
  late MockCarDetailsLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockCarDetailsRemoteDataSource();
    mockLocalDataSource = MockCarDetailsLocalDataSource();
    repository = CarDetailsRepositoryImpl(
      carDetailsRemoteDataSource: mockRemoteDataSource,
      carDetailsLocalDataSource: mockLocalDataSource,
    );
  });
  final tCarId = '123';
  final tHostModel = HostModel(name: 'Ahmed',

        starHost: 'Top Host',
        joinTime:DateTime(2023, 1, 1),
        trips: 50,
        imageUrl: 'https://example.com/image.png',
        rate: 4.8,
        responseTime: '15 mins',
        phoneNumber: '0123456789'
      );
     final tCarModel= CarDetailsModel(id: '123', name: 'car123', pricePerHour: 1500, rate: 4.5,
         trips: 10, imagesUrl: [ 'https://example.com/image.png', 'https://example.com/image.png']) ;
  final  tLocationsList= [PickupLocationModel(title:  'Cairo Airport',
      subtitle:  'Terminal 3', price: 150.0, lat: 30.121, lng: 31.405),
    PickupLocationModel(title:  'Cairo Airport',
        subtitle:  'Terminal 3', price: 150.0, lat: 30.121, lng: 31.405)] ;


  test('should return cached data when it exists and not call remote', () async {
    // Arrange
    when(mockLocalDataSource.getCachedCarDetails(tCarId))
        .thenAnswer((_) async => tCarModel);
    when(mockLocalDataSource.getCachedHost(tCarId))
        .thenAnswer((_) async => tHostModel);
    when(mockLocalDataSource.getCachedLocations(tCarId))
        .thenAnswer((_) async => tLocationsList);

    // Act
    final result = await repository.getCarDetails(tCarId);

    // Assert
    expect(result, isA<Right>());
    // should remote not called
    verifyZeroInteractions(mockRemoteDataSource);
    verify(mockLocalDataSource.getCachedCarDetails(tCarId));
  });
  test('should fetch from remote when cache is empty and then save it to cache', () async {
    // Arrange: الكاش فاضي وبيرمي Exception
    when(mockLocalDataSource.getCachedCarDetails(tCarId)).thenThrow(NotFoundException());
    when(mockLocalDataSource.getCachedHost(tCarId)).thenThrow(NotFoundException());
    when(mockLocalDataSource.getCachedLocations(tCarId)).thenThrow(NotFoundException());

    // لما يكلم الـ Remote يرجع بيانات
    when(mockRemoteDataSource.getCarDetails(tCarId)).thenAnswer((_) async => tCarModel);
    when(mockRemoteDataSource.getHost(tCarId)).thenAnswer((_) async => tHostModel);
    when(mockRemoteDataSource.getLocations(tCarId)).thenAnswer((_) async => tLocationsList);

    // Act
    await repository.getCarDetails(tCarId);

    // Assert: تأكد إنه نادى الـ Remote وكمان عمل Cache للداتا اللي جت
    verify(mockRemoteDataSource.getCarDetails(tCarId));
    verify(mockLocalDataSource.cacheCarDetails(tCarId, tCarModel));
  });
}