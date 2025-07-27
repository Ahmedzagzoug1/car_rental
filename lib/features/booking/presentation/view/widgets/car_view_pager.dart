import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class CarViewPager extends StatefulWidget {
 final List<String>? imagesUrl;
  const CarViewPager({super.key,this.imagesUrl });

  @override
  State<CarViewPager> createState() => _CarViewPagerState();
}

class _CarViewPagerState extends State<CarViewPager> {
  final PageController _pageController = PageController();


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imagesUrl == null || widget.imagesUrl!.isEmpty) {
      return const Center(child: Text('No images to display'));
    }
    return Scaffold(
      body:  SizedBox(
        //height: 251.h,
        child:Stack(
        children: [
          // PageView for the main content
          PageView.builder(
            controller: _pageController,

            itemCount: widget.imagesUrl?.length ,
            itemBuilder: (context, index) {
              // For demonstration, using colored containers.
              // You can replace this with your actual image widgets or content.
              return CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: widget.imagesUrl![index],
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              );
            },
          ),
          // Page indicator at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0), // Adjust padding as needed
              child: SmoothPageIndicator(
                controller: _pageController,
                count: widget.imagesUrl!.length ,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.green, // Active dot color (similar to image)
                  dotColor: Colors.white, // Inactive dot color
                  dotHeight: 8.0,
                  dotWidth: 8.0,
                  spacing: 4.0,
                  expansionFactor: 2, // Make the active dot slightly larger
                ),
              ),
            ),
          ),
        ],
      ),
      )  );
  }
}
