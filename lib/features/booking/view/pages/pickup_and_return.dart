import 'package:car_rental/features/booking/view/widgets/map_widget.dart';
import 'package:car_rental/features/booking/view/widgets/pickup_menu.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
class PickupAndReturn extends StatelessWidget {
  const PickupAndReturn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Pickup & Return '),
        leading: Icon(Icons.arrow_back_ios),

        backgroundColor: Colors.green.shade700,
        elevation: 0,
      ),
      body: Column(
        children: [
          MapWidget(),
          PickupMenu(),
          ElevatedButton(onPressed: (){

          },

            style: Theme.of(context).elevatedButtonTheme.style,
            child: Text(tr('save_btn')??'save' ,),
          ),
        ],
      ),
    );
  }
}
