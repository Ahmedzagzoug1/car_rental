import 'package:equatable/equatable.dart';

class PickupLocationEntity  extends Equatable{
  final String title;
  final String subtitle;
  final String price;

  PickupLocationEntity({required this.title, required this.subtitle, required this.price});

  @override
  // TODO: implement props
  List<Object?> get props => [title,subtitle,price];
}