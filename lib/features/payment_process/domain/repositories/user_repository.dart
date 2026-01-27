import 'package:car_rental/features/payment_process//domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUserStatus(String userId);
}

