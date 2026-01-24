import 'package:equatable/equatable.dart';

class DriverEntity extends Equatable{
  final String imageUrl;
  final String MobileNumber;

DriverEntity({required this.imageUrl,required this.MobileNumber,} );
  @override
  // TODO: implement props
  List<Object?> get props =>[imageUrl,MobileNumber];


}