import 'package:car_rental/features/booking/domain/entities/car_details_entity.dart';
import 'package:car_rental/features/booking/domain/entities/host_entity.dart';
import 'package:car_rental/features/booking/presentation/cubit/car_details_cubit/car_details_cubit.dart';
import 'package:car_rental/features/booking/presentation/cubit/host_cubit/host_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_rental/core/resources/color_manager.dart';
import 'package:car_rental/core/resources/value_manager.dart';

class HostDetails extends StatelessWidget {
  final HostEntity hostEntity;
  HostDetails({super.key, required this.hostEntity});


  @override
  Widget build(BuildContext context) {
    String joinTime=context.read<CarDetailsCubit>().joinDateFromTimestamp(
        hostEntity.joinTime);
          return Padding(
            padding: EdgeInsets.all(AppPadding.p8.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Host',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineLarge,
                ),
                SizedBox(height: AppSize.s12.h),
                Container(
                  padding: EdgeInsets.all(AppPadding.p16.r),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(AppSize.s20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(AppSize.s0_2),
                        spreadRadius: AppSize.s1.r,
                        blurRadius: AppSize.s5.r,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //image and review
                      Column(
                        children: [
                          CircleAvatar(
                            radius: AppSize.s30.r,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: hostEntity.imageUrl,
                                width: AppSize.s60.w,
                                height: AppSize.s60.h,
                                fit: BoxFit.cover,
                                placeholder: (context,
                                    url) => const CircularProgressIndicator(),
                                errorWidget: (context, url,
                                    error) => const Icon(Icons.error),
                              ),
                            ),
                          ),
                          SizedBox(height: AppSize.s8.h),
                          Row(
                            children: [
                              const Icon(
                                  Icons.star, color: Colors.green, size: 14),
                              SizedBox(width: AppSize.s4.w),
                              Text(
                                '${hostEntity.rate}',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .displaySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: AppSize.s12.w),

                      //host details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hostEntity.name,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headlineMedium,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.stars, color: Colors.orange,
                                    size: 16),
                                SizedBox(width: AppSize.s4.w),
                                Text(
                                  hostEntity.starHost,
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodySmall,
                                ),
                              ],
                            ),
                            Text(
                              '${hostEntity
                                  .trips} Trips • Join $joinTime',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .displaySmall,
                            ),
                            Text(
                              'Responds in ${hostEntity.responseTime}',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .displaySmall,
                            ),
                          ],
                        ),
                      ),

                      //icon contact
                      Column(
                        children: [
                          _buildActionIcon(Icons.phone),
                          SizedBox(height: AppSize.s12.h),
                          _buildActionIcon(Icons.chat_bubble_outline),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

          );

  }

    Widget _buildActionIcon(IconData icon) {
      return CircleAvatar(
        radius: AppSize.s18.r,
        backgroundColor: Colors.green.shade100,
        child: Icon(icon, color: Colors.green, size: AppSize.s20.r),
      );
    }
    }

