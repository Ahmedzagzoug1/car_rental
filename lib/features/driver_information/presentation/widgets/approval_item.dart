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
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
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
