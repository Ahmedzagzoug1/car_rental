import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/routes/app_router.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/map_widget.dart';
import 'package:car_rental/features/booking/presentation/view/widgets/pickup_menu.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SelectLocation extends StatelessWidget {
  const SelectLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Pickup & Return '),
        leading: InkWell(child:  Icon(Icons.arrow_back_ios),
            onTap: (){Navigator.pop(context);}),
        backgroundColor: ColorManager.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
              height: 204.h,
      
              child: MapWidget()),
           PickupMenu(),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(onPressed: (){
                      Navigator.pushNamed(context, AppRouter.carDetailsRoute);
              },
      
                style: Theme.of(context).elevatedButtonTheme.style,
                child:const Text( 'save' )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
