import 'package:equatable/equatable.dart';

class OrderCarEntity extends Equatable{
  final String name;
  final String date_of_rental;
  final String rental_person_name;
  final String rental_person_number;
  final String image_url;
  OrderCarEntity(
  {
    required this.name,
    required this.date_of_rental,
    required this.rental_person_name,
    required this.rental_person_number,
    required this.image_url,
}
      );

  @override
  // TODO: implement props
  List<Object?> get props => [name,date_of_rental,rental_person_name,rental_person_number,image_url];
}