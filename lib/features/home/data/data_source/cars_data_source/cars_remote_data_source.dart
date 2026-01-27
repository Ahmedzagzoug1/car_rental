import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:car_rental/features/home/data/models/car_model.dart';

import '../../../../../core/services/service_locators.dart';
class CarsRemoteDataSource{
final  FirebaseFirestore _firestore = sl<FirebaseFirestore>();
Future<List<CarModel>> getCars() async {
  debugPrint("Fetching cars...");

  QuerySnapshot snapshot = await _firestore.collection('car').get();
  debugPrint('${snapshot.size} documents found');
  for (var doc in snapshot.docs) {
    debugPrint("Doc ID: ${doc.id}, data: ${doc.data()}");
  }
  final data = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

  final cars = await compute(parseCars, data);

  return cars;
}

 Future<void> addFiveCars() async {
  // 1. مصفوفة البيانات
  final List<Map<String, dynamic>> carsData = [
    {
      "id": "car_2",
      "name": "Fast Toyota",
      "car_number": "Cairo25326",
      "availability": "At 6 Days",
      "host": "/users/D47yCrFPJNYXSF7Ej02cN3pxnIc2", // سيتم تحويله لـ Reference
      "price": 1000.5,
      "rate": 4,
      "trips": 5,
      "image": "https://www.cars-data.com/pictures/toyota/toyota-auris_3019_5.jpg",
      "images_url": ["https://www.cars-data.com/pictures/toyota/toyota-auris_3019_5.jpg",
        "https://media.toyota.co.uk/wp-content/uploads/sites/5/2012/11/T_10148-scaled.jpg",
      "https://tse2.mm.bing.net/th/id/OIP.Nl3qZX8yZJ7eSrljE96sJwHaFj?pid=ImgDet&w=474&h=355&rs=1&o=7&rm=3.jpg"],
      "pickup_locations": [
        {"lat": 4.222, "lng": 12.225, "price": 1800, "title": "cairo", "subtitle": "NasrCity"},
        {"lat": 4.221, "lng": 12.245, "price": 1800, "title": "cairo", "subtitle": "NasrCity"},
        {"lat": 4.223, "lng": 12.255, "price": 1800, "title": "cairo", "subtitle": "NasrCity"},
        {"lat": 4.225, "lng": 12.265, "price": 1800, "title": "cairo", "subtitle": "NasrCity"},

      ]
    },
    {
      "id": "car_1",
      "name": "Car 1",
      "car_number": "Sharqia25326",
      "availability": "At 5 Days",
      "host": "/users/D47yCrFPJNYXSF7Ej02cN3pxnIc2", // سيتم تحويله لـ Reference
      "price": 500.5,
      "rate": 4.5,
      "trips": 10,
      "image": "https://...",
      "images_url": ["https://...", "https://..."],
      "pickup_locations": [
        {"lat": 4.222, "lng": 12.225, "price": 1800, "title": "cairo", "subtitle": "NasrCity"},
      ]
    },
    {
      "id": "car_1",
      "name": "Car 1",
      "car_number": "Sharqia25326",
      "availability": "At 5 Days",
      "host": "/users/D47yCrFPJNYXSF7Ej02cN3pxnIc2", // سيتم تحويله لـ Reference
      "price": 500.5,
      "rate": 4.5,
      "trips": 10,
      "image": "https://...",
      "images_url": ["https://...", "https://..."],
      "pickup_locations": [
        {"lat": 4.222, "lng": 12.225, "price": 1800, "title": "cairo", "subtitle": "NasrCity"},
      ]
    },
    {
      "id": "car_1",
      "name": "Car 1",
      "car_number": "Sharqia25326",
      "availability": "At 5 Days",
      "host": "/users/D47yCrFPJNYXSF7Ej02cN3pxnIc2", // سيتم تحويله لـ Reference
      "price": 500.5,
      "rate": 4.5,
      "trips": 10,
      "image": "https://...",
      "images_url": ["https://...", "https://..."],
      "pickup_locations": [
        {"lat": 4.222, "lng": 12.225, "price": 1800, "title": "cairo", "subtitle": "NasrCity"},
      ]
    },
    // كرر هذا الهيكل لـ 4 سيارات أخرى...
  ];

  print('جاري بدء عملية الإضافة...');

  try {
    // 2. استخدام WriteBatch للعمليات المتعددة
    final WriteBatch batch = _firestore.batch();

    for (var car in carsData) {
      // أ- تحويل الـ Host من String إلى DocumentReference (مهم جداً للـ Database)
      final hostRef = _firestore.doc(car['host']);

      // ب- إنشاء مرجع السيارة الرئيسي
      final carRef = _firestore.collection('car').doc(car['id']);

      // ج- فصل الـ pickup_locations لرفعها كـ Subcollection
      final List<Map<String, dynamic>> locations = List<Map<String, dynamic>>.from(car['pickup_locations']);

      // د- تجهيز بيانات السيارة بدون قائمة المواقع (لأن المواقع ستكون في مجموعة منفصلة)
      final Map<String, dynamic> carToUpload = Map.from(car);
      carToUpload.remove('pickup_locations');
      carToUpload['host'] = hostRef; // تحديث الـ host ليكون مرجعاً حقيقياً

      // هـ- إضافة عملية إنشاء السيارة للـ Batch
      batch.set(carRef, carToUpload);

      // و- إضافة المواقع كـ Subcollection (كل موقع كمستند منفصل)
      for (var loc in locations) {
        final locRef = carRef.collection('pickup_locations').doc(); // ID تلقائي
        batch.set(locRef, loc);
      }
    }

    // 3. تنفيذ كل العمليات (Commit)
    await batch.commit();
    print('✅ تم إضافة 5 سيارات مع مواقعهم بنجاح!');

  } on FirebaseException catch (e) {
    // 4. معالجة أخطاء Firebase بشكل محدد
    print('❌ خطأ من Firebase: ${e.code} - ${e.message}');
    // هنا يمكنك إظهار SnackBar للمستخدم توضح أن المشكلة في الصلاحيات أو الاتصال
  } catch (e) {
    // 5. معالجة أي أخطاء أخرى (مثل أخطاء في البيانات نفسها)
    print('⚠️ خطأ غير متوقع: $e');
  }
}
// find car
}
List<CarModel> parseCars(List<Map<String, dynamic>> data) {
  return data.map((e) => CarModel.fromJson(e)).toList();
}
