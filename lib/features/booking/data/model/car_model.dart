import 'package:car_rental/features/booking/data/model/host_model.dart';
import 'package:car_rental/features/booking/data/model/pickup_location_model.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_model.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()

class CarModel extends CarDetailsEntity{

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final double rate;

  @HiveField(4)
  final int trips;

  @HiveField(5)
  final List<String> imagesUrl;

  @HiveField(6)
  final HostModel host;

  @HiveField(7)
  final List<PickupLocationModel> pickupLocationModels ;
  CarModel({
    required this.id,
  required this.name,
  required this.price,
  required this.rate,
  required this.trips,
  required this.imagesUrl,
  required this.host,

    required this.pickupLocationModels
  }) : super(id: id, name: name,
      price: price, rate: rate, trips: trips, imagesUrl: imagesUrl, host: host, pickupLocationEntities: pickupLocationModels);

  // JSON serialization methods
  factory CarModel.fromJson(Map<String, dynamic> json) => _$CarModelFromJson(json);
  Map<String, dynamic> toJson() => _$CarModelToJson(this);
  }

/*
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
      'images_url': imagesUrl,
      // To handle the nested object, we call its own toJson method.
      'hostModel': host,

    };
  }*/
