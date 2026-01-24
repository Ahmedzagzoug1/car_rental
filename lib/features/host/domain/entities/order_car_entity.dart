import 'package:equatable/equatable.dart';

class OrderCarEntity extends Equatable{
  final String name;
  final String dateOfRental;
  final String rentalPersonName;
  final String rentalPersonNumber;
  final String imageUrl;
  OrderCarEntity(
  {
    required this.name,
    required this.dateOfRental,
    required this.rentalPersonName,
    required this.rentalPersonNumber,
    required this.imageUrl,
}
      );

  @override
  // TODO: implement props
  List<Object?> get props => [name,dateOfRental,rentalPersonName,rentalPersonNumber,imageUrl];
}