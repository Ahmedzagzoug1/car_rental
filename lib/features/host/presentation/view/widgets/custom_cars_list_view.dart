import 'package:car_rental/core/resources/value_manager.dart';
import 'package:car_rental/core/shared_components/data/models/car_model.dart';
import 'package:car_rental/core/shared_components/data/models/host_model.dart';
import 'package:car_rental/features/host/data/data_source/remote_host_cars_data_source/remote_host_cars_data_source.dart';
import 'package:car_rental/features/host/domain/usecases/get_host_cars_usecase.dart';
import 'package:car_rental/features/host/presentation/view/widgets/car_item_widget.dart';
import 'package:flutter/material.dart';
class CustomCarsListview extends StatelessWidget {
   CustomCarsListview({super.key});
  final RemoteHostCarsDataSource _remoteDataSource = RemoteHostCarsDataSource();

  @override
  Widget build(BuildContext context) {
    String hostId='';
    return Container();
    /*return FutureBuilder<List<BaseHostModel>>(

      future: _remoteDataSource.getHostCars(GetHostCarParams(hostId: hostId)), // call your function here
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No cars found"));
        }

        final cars = snapshot.data!;

        return ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) {
            final car = cars[index];
            return ListTile(
              title: Text(car.name ?? "Unknown"),
              // depends on HostCarModel fields
          //    subtitle: Text("Model: ${car. ?? ''}"),
            );
          },
        );
      },
    );*/
  }
}