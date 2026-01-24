import 'package:car_rental/features/home/data/data_source/brand_data_source/brand_remote_data_source.dart';
import 'package:car_rental/features/home/data/repositories/brand_repository_implement.dart';
import 'package:car_rental/features/home/domain/usecases/get_brands_usecase.dart';
import 'package:car_rental/features/home/presentation/view_model/providers/brand_provider.dart';
import 'package:car_rental/features/home/presentation/view_model/providers/car_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestProvider extends StatelessWidget {
  const TestProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CarProvider>();

    return  Scaffold(
      appBar: AppBar(title: Text("Cars")),
      body: Consumer<CarProvider>(
        builder: (context, provider, child) {
          if (provider.state==CarState.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (provider.cars.isEmpty) {
            return Center(child: Text("No cars found"));
          }
          return ListView.builder(
            itemCount: provider.cars.length,
            itemBuilder: (context, index) {
              final car = provider.cars[index];
              return ListTile(
                title: Text(car.name),
                subtitle: Text("${car.price} EGP"),
                leading: Image.network(car.image, width: 50, height: 50, fit: BoxFit.cover),
              );
            },
          );
        },
      ),
    );
  }
}
