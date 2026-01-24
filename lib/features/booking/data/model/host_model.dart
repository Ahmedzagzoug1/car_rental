
import 'package:car_rental/core/shared_components/data/models/base_host_model.dart';
import 'package:car_rental/features/booking/domain/entities/host_entity.dart';

class HostModel extends BaseHostModel{
  HostModel({required super.name, required super.starHost, required super.joinTime, required super.trips, required super.imageUrl, required super.responseTime, required super.rate});
 HostEntity toDomain(){
  return  HostEntity(name: name, starHost: starHost, joinTime: joinTime, trips: trips,
      imageUrl: imageUrl, rate: rate, responseTime: responseTime);
  }

}