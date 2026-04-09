import 'package:flutter/material.dart';
class ErrorPage extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorPage({super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            ElevatedButton(onPressed: onRetry, child: const Text("try another time")),
          ],
        ),
      ),
    );
  }
}