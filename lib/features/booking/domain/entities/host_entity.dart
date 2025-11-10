
import 'package:equatable/equatable.dart';

class HostEntity extends Equatable{
  String name;
  String starHost;
  String joinTime;
  int trips;
  String imageUrl;
  String  responseTime;
  double rate;
  String userId;
  String phoneNumber;

  HostEntity(
  {required this.name,required this.starHost,required this.joinTime, required this.trips,
    required this.imageUrl,
  required this.rate
    ,required this.responseTime,
  required this.phoneNumber,
  required this.userId});

  @override
  // TODO: implement props
  List<Object?> get props =>[name,starHost,joinTime,trips,imageUrl,responseTime,rate,
  phoneNumber,userId];

}