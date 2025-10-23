import 'package:equatable/equatable.dart';

class HostEntity extends Equatable{
  final String name;
final  String starHost;
final int trips;
final String responseTime;
final double rate;

  HostEntity({required this.name,required this.starHost,required this.trips,required this.responseTime,
      required this.rate});

  @override
  // TODO: implement props
  List<Object?> get props => [name,starHost,trips,responseTime,rate];

}