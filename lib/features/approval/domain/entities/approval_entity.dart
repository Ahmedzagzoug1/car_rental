import 'package:equatable/equatable.dart';

class ApprovalEntity extends Equatable{
  final String? photoUrl;
  final String? phone;
  final bool phoneVerified;

  const ApprovalEntity({
  this.photoUrl,
  this.phone,
  this.phoneVerified = false,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [];
  }