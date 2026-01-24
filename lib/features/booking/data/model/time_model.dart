
class TimeModel {
 final String pickupDate;
 final String pickupTime;
 final String returnDate;
 final String returnTime;
        TimeModel({  required this.pickupDate,required this.pickupTime,
          required this.returnDate,required this.returnTime });

static  TimeModel specificTimeObject = TimeModel(
    pickupDate: "2025-08-15",
    pickupTime: "09:00",
    returnDate: "2025-08-17",
    returnTime: "17:30",
  );          }


