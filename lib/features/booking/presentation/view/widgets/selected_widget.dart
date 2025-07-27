import 'package:flutter/material.dart';
class SelectedWidget extends StatelessWidget {
 final  String textHeadline;
 final IconData iconData;
 final String content;
 final String toggleText;
 void Function()? onTap;
   SelectedWidget({super.key, required this.textHeadline,
     required this.iconData,
     required this.toggleText,
     required this.content,this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            textHeadline,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                   Icon(iconData, color: Colors.green),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                        content,
                        style: Theme.of(context).textTheme.displayMedium
                    ),
                  ),
                  InkWell(onTap: onTap,
                    child: Row(
                      children: [
                        Text(
                          toggleText,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.green),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
