import 'package:car_rental/features/booking/domain/entities/booking_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel extends BookingEntity{




  BookingModel({required super.id, required super.carRef, required super.userRef,
  required super.hostRef, required super.pickupLocation, required super.pickupAddress,
  required super.dropOffLocation, required super.dropOffAddress, required super.startDate,
  required super.endDate, required super.days, required super.pricePerDay, required super.totalPrice,
  required super.status, required super.createdAt});
// createdAt = createdAt ?? Timestamp.now();

  Map<String, dynamic> toJson() {
    return {
      'carRef': carRef,
      'userRef': userRef,
      'hostRef': hostRef,
      'pickupLocation': pickupLocation,
      'pickupAddress': pickupAddress,
      'dropoffLocation': dropOffLocation,
      'dropoffAddress': dropOffAddress,
      'startDate': Timestamp.fromDate(startDate),
      'endDate': Timestamp.fromDate(endDate),
      'days': days,
      'pricePerDay': pricePerDay,
      'totalPrice': totalPrice,
      'status': status,
      'createdAt': createdAt,
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map, {String? id}) {
    Timestamp tsStart = map['startDate'] as Timestamp;
    Timestamp tsEnd = map['endDate'] as Timestamp;
    return BookingModel(
      id: id,
      carRef: map['carRef'] as DocumentReference,
      userRef: map['userRef'] as DocumentReference,
      hostRef: map['hostRef'] as DocumentReference,
      pickupLocation: map['pickupLocation'] as GeoPoint,
      pickupAddress: map['pickupAddress'] as String,
      dropOffLocation: map['dropoffLocation'] as GeoPoint,
      dropOffAddress: map['dropoffAddress'] as String,
      startDate: tsStart.toDate(),
      endDate: tsEnd.toDate(),
      days: (map['days'] ?? 0) as int,
      pricePerDay: (map['pricePerDay'] ?? 0) as int,
      totalPrice: (map['totalPrice'] ?? 0) as int,
      status: (map['status'] ?? 'pending') as String,
      createdAt: map['createdAt'] as Timestamp? ?? Timestamp.now(),
    );
  }
}
