import 'package:car_rental/features/booking/data/model/booking_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateBookingRemoteDataSource{
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> createBooking(BookingModel booking) async {
    /*
  final docRef = await firestore.collection('bookings').add(booking.toJson());
  return docRef.id;*/
    throw  Exception();
  }


//check car before booking
  Future<List<Map<String, dynamic>>> getBookingsForCar(DocumentReference carRef) async {
  final snap = await firestore
      .collection('bookings')
      .where('carRef', isEqualTo: carRef)
      .where('status', whereIn: ['pending', 'confirmed'])
      .get();
  return snap.docs.map((d) => d.data()).toList();
  }
  }

