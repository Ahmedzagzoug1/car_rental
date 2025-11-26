import 'package:equatable/equatable.dart';

class HostEntity extends Equatable{
  final String name;
final  String starHost;
final int trips;
final String responseTime;
final double rate;
  final DateTime joinTime;
  final String phoneNumber;
  final String imageUrl;


  HostEntity({required this.name,required this.starHost,required this.trips,required this.responseTime,
      required this.rate,required this.joinTime,required this.imageUrl,required this.phoneNumber});

  @override
  // TODO: implement props
  List<Object?> get props => [name,starHost,trips,responseTime,rate,imageUrl,phoneNumber,joinTime];

}