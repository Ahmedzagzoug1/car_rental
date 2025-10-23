import 'package:cloud_firestore/cloud_firestore.dart';

class BookingEntity{
  final String? id;
  final DocumentReference carRef;
  final DocumentReference userRef;
  final DocumentReference hostRef;
  final GeoPoint pickupLocation;
  final String pickupAddress;
  final GeoPoint dropOffLocation;
  final String dropOffAddress;
  final DateTime startDate;
  final DateTime endDate;
  final int days;
  final int pricePerDay;
  final int totalPrice;
  final String status;
  final Timestamp createdAt;

  BookingEntity({
     required this.id,required
      this.carRef,
      required  this.userRef,
      required this.hostRef,
    required this.pickupLocation,
    required
      this.pickupAddress,required
      this.dropOffLocation,required
      this.dropOffAddress,required
      this.startDate,required
      this.endDate,required
      this.days,required
      this.pricePerDay,required
      this.totalPrice,required
      this.status,required
      this.createdAt});
}