import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:faker/faker.dart';

class TimeEntity extends Equatable {
 final String pickupDate;
 final String pickupTime;
 final String returnDate;
 final String returnTime;
        TimeEntity({  required this.pickupDate,required this.pickupTime,
          required this.returnDate,required this.returnTime });

  @override
  // TODO: implement props
  List<Object?> get props => [pickupDate,pickupTime,returnTime,returnDate];

         }


