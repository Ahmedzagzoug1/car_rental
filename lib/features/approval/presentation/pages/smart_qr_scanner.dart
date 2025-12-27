/*
import 'package:car_rental/features/approval/domain/usecases/get_from_gallery_usecase.dart';
import 'package:car_rental/features/approval/domain/usecases/scan_or_upload_from_camera_usecase.dart';
import 'package:car_rental/features/approval/presentation/cubits/scanner_cubit/scanner_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../core/services/service_locators.dart';

class SmartQrScanner extends StatefulWidget {

  const SmartQrScanner({super.key});

  @override
  State<SmartQrScanner> createState() => _SmartQrScannerState();
}

class _SmartQrScannerState extends State<SmartQrScanner> {
final MobileScannerController controller=sl<MobileScannerController>();
  @override
  Widget build(BuildContext context) {
    
    
    
    return BlocProvider<ScannerCubit>(
  create: (context) => ScannerCubit(sl<ScanFromGalleryUseCase>(),sl<ScanOrUploadFromCameraUsecase>()),
  child:BlocListener<ScannerCubit, ScannerState>(
      listener: (context, state) {
        if (state is ScannerSuccess) {
          Navigator.pop(context, state.result);
        } else if (state is ScannerError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },child:  Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
//camera
          MobileScanner(
            controller: controller,

              onDetect: (capture) {
                context.read<ScannerCubit>().onDetect(capture);
              },
          ),
//over lay
    Container(
    decoration: ShapeDecoration(
    shape: QrScannerOverlayShape(
    borderColor: Colors.blueAccent,
    borderRadius: 10,
    borderLength: 30,
    borderWidth: 10,
    cutOutSize: MediaQuery.of(context).size.width * 0.7,
    ),
    ),
    ),
     Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                IconButton(
                  color: Colors.white,
                  icon:( controller.torchEnabled)?
                 Icon( Icons.flash_off):Icon( Icons.flash_on),
                  onPressed: () =>
                  controller.toggleTorch(),
                ),

                IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.cameraswitch),
                  onPressed: () => controller.switchCamera(),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      )
  )
  )
    );


  }

/*
BlocBuilder<ScannerCubit, ScannerState>(
      builder: (context, state) {
        final cubit=context.read<ScannerCubit>();
        return
 */
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

// كلاس مساعد لرسم المربع فوق الكاميرا
class QrScannerOverlayShape extends ShapeBorder {
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final double borderLength;
  final double cutOutSize;

  const QrScannerOverlayShape({
    this.borderColor = Colors.white,
    this.borderWidth = 1.0,
    this.borderRadius = 0,
    this.borderLength = 40,
    this.cutOutSize = 250,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) => Path()..addRect(rect);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final width = rect.width;
    final height = rect.height;

    final paint = Paint()
      ..color = Colors.black54
      ..style = PaintingStyle.fill;

    final cutOutRect = Rect.fromCenter(
      center: Offset(width / 2, height / 2),
      width: cutOutSize,
      height: cutOutSize,
    );

    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect(rect),
        Path()..addRRect(RRect.fromRectAndRadius(cutOutRect, Radius.circular(borderRadius))),
      ),
      paint,
    );

    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawRRect(
      RRect.fromRectAndRadius(cutOutRect, Radius.circular(borderRadius)),
      borderPaint,
    );
  }

  @override
  ShapeBorder scale(double t) => this;
}

 */