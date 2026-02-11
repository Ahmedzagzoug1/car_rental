import 'package:equatable/equatable.dart';

class TimeEntity extends Equatable {
 final String pickupDate;
 final String pickupTime;
 final String returnDate;
 final String returnTime;
    const    TimeEntity({  required this.pickupDate,required this.pickupTime,
          required this.returnDate,required this.returnTime });

  TimeEntity  copyWith({
    String? pickupDate,
    String? pickupTime,
    String? returnDate,
    String? returnTime,
}){
      return TimeEntity(  pickupDate: pickupDate ?? this.pickupDate,
          pickupTime: pickupTime ?? this.pickupTime,
          returnDate: returnDate ?? this.returnDate,
          returnTime: returnTime ?? this.returnTime,
      );
    }
  @override
  // TODO: implement props
  List<Object?> get props => [pickupDate,pickupTime,returnTime,returnDate];

         }


