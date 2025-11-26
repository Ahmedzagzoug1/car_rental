
import 'package:car_rental/core/shared_components/data/models/host_model.dart';
import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/host/domain/entities/host_car_entity.dart';
import 'package:car_rental/features/host/domain/entities/host_entity.dart';

import '../../../../core/shared_components/data/models/car_model.dart' show CarModel;

extension HostModelMapper on HostModel {
  /*HostEntity toHostEntity (){
    return HostEntity(
        name: name,
        starHost: starHost,
        responseTime: responseTime,
        trips: trips,

      rate: rate
    );
  }*/
}