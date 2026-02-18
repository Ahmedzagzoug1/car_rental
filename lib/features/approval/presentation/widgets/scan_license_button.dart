import 'package:car_rental/features/approval/domain/entities/scan_source.dart';
import 'package:car_rental/features/approval/presentation/cubits/ocr_cubit/ocr_cubit.dart';
import 'package:car_rental/features/approval/presentation/widgets/choice_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ScanLicenseButton extends StatelessWidget {
  const ScanLicenseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final source = await showDialog<ScanSource>(
          context: context,
          builder: (_) => const ChoiceDialog(),
        );

        if (source == ScanSource.camera) {
          /*   Navigator.push(
            context,
            MaterialPageRoute(
            builder: (_) => const SmartQrScanner(),
            ),
            );*/
        } else if (source == ScanSource.gallery) {
          context.read<OcrCubit>().uploadImageToOcr();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[100],
        ),
        child: const Row(
          children: [


            Icon(Icons.credit_card_outlined,
                color: Colors.green, size: 28),
            SizedBox(width: 16),
            Text(
              'Scan license to autofill',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
