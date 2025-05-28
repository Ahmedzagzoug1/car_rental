import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/features/home/models/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CarItemWidget extends StatelessWidget {
  final CarModel car;
   CarItemWidget({super.key,required this.car});

  @override
  Widget build(BuildContext context) {
    return     Container(
      margin: EdgeInsets.only(right: AppMargin.m20.r),
    width: AppSize.s200.sp,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(AppSize.s16),
    color: Colors.white,
    boxShadow: [BoxShadow(color: ColorManager.black, blurRadius: 6)],
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Stack(
    children: [
    ClipRRect(
    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
    child: Image.network(
    car.image,
    height: 120,
    width: double.infinity,
    fit: BoxFit.cover,
    ),
    ),
    const Positioned(
    right: 10,
    top: 10,
    child: Icon(Icons.favorite_border, color: Colors.white),
    )
    ],
    ),
    Padding(
    padding: const EdgeInsets.all(12),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(car.name, style: const TextStyle(fontWeight: FontWeight.bold)),
    const SizedBox(height: 4),
    Row(
    children: [
    Icon(Icons.star, color: Colors.green, size: 16),
    const SizedBox(width: 4),
    Text(car.rating.toString()),
    ],
    ),
    const SizedBox(height: 4),
    Text(car.availability, style: const TextStyle(fontSize: 12)),
    const SizedBox(height: 8),
    Row(
    children: [
    const Icon(Icons.event_seat, size: 16, color: Colors.green),
    const SizedBox(width: 4),
    const Text("4 Seats", style: TextStyle(fontSize: 12)),
    const Spacer(),
    const Icon(Icons.attach_money, color: Colors.green, size: 16),
    Text("${car.price}/hour", style: const TextStyle(fontSize: 12)),
    ],
    )
    ],
    ),
    )
    ],
    ),
    );


  }
}
