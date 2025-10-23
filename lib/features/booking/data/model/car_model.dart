import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';

class CarModel extends CarDetailsEntity{
  CarModel({required super.name, required super.price, required super.rate,
    required super.trips, required super.imagesUrl, required super.host});
  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(

      name: json['name'] as String,
      price: (json['price']as num).toDouble(),
      rate: (json['rate']as num) .toDouble(),
      trips: (json['trips']),
      imagesUrl:  (json['images_url'] as List<dynamic>?)
          ?.map((item) => item.toString())
          .toList()
          ?? [],
      host: json['host'] ,

    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'rate': rate,
      'trips': trips,
      'imagesUrl': imagesUrl,
      // To handle the nested object, we call its own toJson method.
      'hostModel': host,

    };
  }
}