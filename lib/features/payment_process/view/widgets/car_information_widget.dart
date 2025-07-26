import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/features/booking/model/car_model.dart';
import 'package:flutter/material.dart';
class CarInformationWidget extends StatelessWidget {
  final CarModel carModel;
  const CarInformationWidget({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return      Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child:     CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: carModel.imagesUrl![0],
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    carModel.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.green[700], size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${carModel.rate.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '• ${carModel.trips} Trips',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${carModel.price.toStringAsFixed(2)}/h',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
