import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../booking/presentation/cubit/host_cubit/host_cubit.dart';


class HostCarDetails extends StatelessWidget {
  const HostCarDetails({super.key});

  @override
  Widget build(BuildContext context) {
return BlocBuilder<HostCubit,HostState>(builder: (context,state){
  if(state is HostLoading){
    return const CircularProgressIndicator();
  }else if (state is HostLoaded){
    final hostEntity=state.hostEntity;
    return SizedBox(
      height: 133,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Host",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Container(
            height: 76,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xffF4FFF4),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(26),
                  child: CachedNetworkImage(imageUrl: hostEntity.imageUrl)
                ),

                const SizedBox(width: 12),

                //host Name and Stars
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                        hostEntity.name,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 3),

                      Row(
                        children:  [
                          const Icon(Icons.emoji_events,
                              color: Colors.orange, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            hostEntity.starHost,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      Row(
                        children:  [
                          Text(
                            "${hostEntity.trips} Trips",
                            style: const TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(width: 6),
                          const Text("•", style: TextStyle(color: Colors.grey)),
                          const SizedBox(width: 6),
                          const Text(
                            "Joined",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Icons
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.call, color: Colors.green, size: 22),
                    SizedBox(height: 8),
                    Icon(Icons.more_horiz, color: Colors.green, size: 22),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),

           Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                const Icon(Icons.star, color: Colors.green, size: 18),
                const SizedBox(width: 4),
                Text(
                  "${hostEntity.rate}",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  "Typically responds in ${hostEntity.responseTime}",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }else  if(state is HostFailure){
    return Text(state.errMessage);
  }else{
   return const Text('undefind error!');
  }
});

  }
}