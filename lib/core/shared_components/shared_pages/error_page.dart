import 'package:flutter/material.dart';
class ErrorPage extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorPage({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(message),
            ElevatedButton(onPressed: onRetry, child: Text("try another one")),
          ],
        ),
      ),
    );
  }
}