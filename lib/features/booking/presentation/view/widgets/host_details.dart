import 'package:car_rental/app/my_app.dart';
import 'package:car_rental/core/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HostDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container();
  }
 /* final HostEntity? hostEntity;
  const HostDetails({super.key,this.hostEntity});

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          'Host',
          style:         Theme.of(context).textTheme.bodyLarge

        ),
        const SizedBox(height: 16),
        Container(
          padding:  EdgeInsets.all(AppPadding.p16.r),
          decoration: BoxDecoration(
            color: Colors.green.shade50, // Light green background
            borderRadius: BorderRadius.circular(AppSize.s12.r), // Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(AppSize.s0_2.r),
                spreadRadius: AppSize.s1.r,
                blurRadius: AppSize.s5.r,
                offset:  Offset(0,AppSize.s3.r), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Host Profile Picture
                  Container(
                    width: AppSize.s60.w,
                    height: AppSize.s60.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          hostEntity!.imageUrl, // Placeholder image
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Host Details (Name, All-Star, Trips, Joined, Response Time)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          hostEntity!.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            // All-Star Host Badge (using a star icon as a placeholder)
                            const Icon(Icons.star, color: Colors.orange, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              hostEntity!.starHost,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${hostEntity!.trips} Trips • Joined ${hostEntity!.joinTime}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 4),

                      ],
                    ),
                  ),
                  // Call and Message Icons
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green.shade100, // Light green background for icons
                        ),
                        padding:  EdgeInsets.all(AppPadding.p8.r),
                        child:  Icon(Icons.phone, color: Colors.green, size: AppSize.s24.r),
                      ),
                       SizedBox(width: AppSize.s8.w),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green.shade100,
                        ),
                        padding:  EdgeInsets.all(AppPadding.p8.r),
                        child:  Icon(Icons.chat_bubble_outline, color: Colors.green, size: AppSize.s40),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.green, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '${hostEntity!.rate}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Typically responds in ${hostEntity!.responseTime}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

      ],
    );;
  }*/
}
