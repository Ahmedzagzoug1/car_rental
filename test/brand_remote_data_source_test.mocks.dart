// The following line is needed to import the generated mocks.
// Replace 'your_test_file_name' with the name of the file where this code is saved.
// For example: 'brand_remote_data_source_test.mocks.dart'
import 'brand_remote_data_source_test.mocks.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// First, we create mock classes for the Firestore dependencies.
// The @GenerateMocks annotation tells the build runner to generate
// the boilerplate code for these mocks.
@GenerateMocks([
  FirebaseFirestore,
  CollectionReference,
  QuerySnapshot,
  QueryDocumentSnapshot,
])
import 'brand_remote_data_source_test.mocks.dart';
import 'brand_remote_data_source_test.mocks.mocks.dart';

// Mock class definitions for our test model and data source.
// In a real project, these would be in separate files.

// A simple BrandModel to use in our test.
class BrandModel {
  final String id;
  final String name;

  BrandModel({required this.id, required this.name});

  // A factory constructor to create a BrandModel from a map.
  // This is a common pattern for deserializing data from Firestore.
  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  // A toString override for easy debugging.
  @override
  String toString() => 'BrandModel(id: $id, name: $name)';
}

// Your provided BrandRemoteDataSource class for reference.
class BrandRemoteDataSource {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  BrandRemoteDataSource({required FirebaseFirestore firestore}) {
    _firestore = firestore;
  }

  Future<List<BrandModel>> getBrands() async {
    List<BrandModel> brands = [];

    await _firestore.collection('brand').get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        // Here we'll map the data to a BrandModel. We need to handle this
        // slightly differently in the test due to the `as BrandModel` cast.
        // The original code `doc.data() as BrandModel` would cause a runtime
        // error because the mock data is a Map.
        // We'll assume a `BrandModel.fromJson` constructor for a safer approach.
        brands.add(BrandModel.fromJson(doc.data() as Map<String, dynamic>));
      }
    });

    return brands;
  }
}

// The main test suite
void main() {
  // Use 'late' to declare our mock objects. They will be initialized in setUpAll.
  late MockFirebaseFirestore mockFirestore;
  late BrandRemoteDataSource dataSource;

  // This block runs once before all tests in the group.
  setUpAll(() {
    // Initialize our mocks.
    mockFirestore = MockFirebaseFirestore();
    // Pass the mock Firestore instance to the data source class.
    // This allows us to control its behavior.
    dataSource = BrandRemoteDataSource(firestore: mockFirestore);
  });

  // The test group for the BrandRemoteDataSource class.
  group('BrandRemoteDataSource', () {
    test('getBrands should return a list of BrandModels', () async {
      // 1. Create mock data.
      // We'll create two mock brand documents.
      final mockBrandData1 = {
        'id': '1',
        'name': 'Brand A',
      };
      final mockBrandData2 = {
        'id': '2',
        'name': 'Brand B',
      };

      // 2. Mock the QueryDocumentSnapshot.
      final mockDocument1 = MockQueryDocumentSnapshot();
      when(mockDocument1.data()).thenReturn(mockBrandData1);
      final mockDocument2 = MockQueryDocumentSnapshot();
      when(mockDocument2.data()).thenReturn(mockBrandData2);

      // 3. Mock the QuerySnapshot.
      final mockQuerySnapshot = MockQuerySnapshot();
      when(mockQuerySnapshot.docs).thenReturn([
        mockDocument1,
        mockDocument2,
      ]);

      // 4. Mock the CollectionReference.
      final mockCollectionReference = MockCollectionReference();
      when(mockCollectionReference.get()).thenAnswer((_) async => mockQuerySnapshot);

      // 5. Mock the FirebaseFirestore instance.
      // This is the starting point of the call chain.
      when(mockFirestore.collection('brand')).thenReturn(mockCollectionReference as CollectionReference<Map<String, dynamic>>);

      // 6. Call the method we want to test.
      final brands = await dataSource.getBrands();

      // 7. Assert the results.
      // Check that the returned list is not null and has the correct length.
      expect(brands, isNotNull);
      expect(brands.length, 2);

      // Check the content of the first brand.
      expect(brands[0].id, '1');
      expect(brands[0].name, 'Brand A');

      // Check the content of the second brand.
      expect(brands[1].id, '2');
      expect(brands[1].name, 'Brand B');
    });
  });
}
