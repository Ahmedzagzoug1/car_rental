import 'package:flutter/material.dart';

import '../../domain/entities/scan_source.dart';
class ScanChoiceDialog extends StatelessWidget {
  const ScanChoiceDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Choose scan source'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: () {
              Navigator.pop(context, ScanSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Gallery'),
            onTap: () {
              Navigator.pop(context, ScanSource.gallery);
            },
          ),
        ],
      ),
    );
  }
}
