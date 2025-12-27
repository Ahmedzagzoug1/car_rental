
import 'package:car_rental/features/host/domain/entities/host_car_entity.dart';

import '../../../../core/shared_components/data/models/car_model.dart' show CarModel;

extension CarModelMapper on CarModel {
  HostCarEntity toHostEntity() {
    return HostCarEntity(
        name: name,
        price: price,
     carNumber: carNumber,
      image: image,
      rating: rate
    );
  }
}