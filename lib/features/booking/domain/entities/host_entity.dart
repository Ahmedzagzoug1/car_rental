
import 'package:equatable/equatable.dart';

class HostEntity extends Equatable{
  String name;
  String starHost;
  String joinTime;
  int trips;
  String imageUrl;
  String  responseTime;
  double rate;

  HostEntity(
  {required this.name,required this.starHost,required this.joinTime, required this.trips,
    required this.imageUrl,
  required this.rate
    ,required this.responseTime});

  @override
  // TODO: implement props
  List<Object?> get props =>[name,starHost,joinTime,trips,imageUrl,responseTime,rate];

}