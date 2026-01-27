import 'package:car_rental/features/booking/presentation/cubit/host_cubit/host_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';

class HostDetails extends StatelessWidget {
  const HostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.green100,
      child: BlocBuilder<HostCubit, HostState>(
        builder: (context, state) {
          if (state is HostLoaded) {
            final hostEntity = state.hostEntity;

            return SizedBox(
              height: AppSize.s200.h,

                child: Padding(
                  padding:  EdgeInsets.all(8.0.r),
                  child: Column(
                   // mainAxisSize: MainAxisSize.min,
                    spacing: AppSize.s12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Host',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      SizedBox(height: AppSize.s8.h),

                           SizedBox(

                             child: Container(
                               height: AppSize.s100.h,
                       padding: EdgeInsets.all(AppPadding.p8.r),
                       decoration: BoxDecoration(
                       color: Colors.green.shade50,
                       borderRadius: BorderRadius.circular(AppSize.s20.r),
                       boxShadow: [
                       BoxShadow(
                       color: Colors.grey.withOpacity(AppSize.s0_2.r),
                       spreadRadius: AppSize.s1.r,
                       blurRadius: AppSize.s5.r,
                       offset: Offset(0, AppSize.s3.r),
                       ),
                       ],
                       ),
                             child:
                             Column(
                               children: [
                   Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                   Column(
                                     children: [
                                       // Host Profile Picture

                                       CircleAvatar(
                                         child: CachedNetworkImage(
                                          imageUrl: hostEntity.imageUrl,
                                          width: AppSize.s52.w,
                                          height: AppSize.s52.h,
                                          fit: BoxFit.contain,
                                          placeholder: (context, url) => const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) => const Icon(Icons.error, size: AppSize.s52),
                                                                       ),
                                       ),
                                      const SizedBox(height: AppSize.s8,),
                                       Row(
                                         children: [
                                           const Icon(Icons.star, color: Colors.green, size: 10),
                                           SizedBox(width: AppSize.s4.w),
                                           Text(
                                             '${hostEntity.rate}',
                                             style: Theme.of(context).textTheme.displaySmall,
                                           ),
                                           SizedBox(width: AppSize.s8.w),

                                         ],
                                       ),
                                     ],
                                   ),


                                SizedBox(width: AppSize.s8.w),
                                // Host Details
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      hostEntity.name,
                                      style:Theme.of(context).textTheme.headlineMedium,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.star, color: Colors.orange, size: 16),
                                        Text(
                                          hostEntity.starHost,
                                          style: Theme.of(context).textTheme.bodySmall,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${hostEntity.trips} Trips • Join ${joinDateFromTimestamp(hostEntity.joinTime)}',
                                      style:Theme.of(context).textTheme.displaySmall,
                                    ),
                                    Text(
                                      'Typically responds in ${hostEntity.responseTime}',
                                      style:  Theme.of(context).textTheme.displaySmall,
                                    ),
                                  ],
                                ),
                                // Call & Chat Icons
      SizedBox(height: AppSize.s20.h,),
                                Row(

                                  children: [
                                    CircleAvatar(
                                      radius: AppSize.s20.r,
                                      backgroundColor: Colors.green.shade100,
                                      child: Icon(Icons.phone, color: Colors.green, size: AppSize.s24.r),
                                    ),
                                    const SizedBox(width: AppSize.s12,),
                                    CircleAvatar(
                                      radius: AppSize.s20.r,
                                      backgroundColor: Colors.green.shade100,
                                      child: Icon(Icons.chat_bubble_outline, color: Colors.green, size: AppSize.s24.r),
                                    ),
                                  ],
                                ),
                              ],
                            ),


                               ],
                             ),
                             ),

                           )
                             ],),
                )
           );
          } else if (state is HostLoading) {
            return Center(child: CircularProgressIndicator(color: ColorManager.primary));
          } else if(state is HostInitial) {
            print( 'inital ');
      return const Text('initial');

          }else{
              return Text(
                (state as HostFailure).errMessage,
                style: TextStyle(color: ColorManager.error),
              );
            }
          }

      ),
    );
  }
}
