import 'package:car_rental/core/resources/color_manager.dart';
import 'package:flutter/material.dart';
class ApprovalItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  void Function()? onTap;
   ApprovalItem({super.key,
  required this. icon,
    required this. title,
    required this. subtitle,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {

      return GestureDetector(
        onTap:onTap ,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Colors.green, size: 30),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineLarge
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: ColorManager.black)

                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
