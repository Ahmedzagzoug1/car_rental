import 'package:car_rental/features/payment_process/presentation/cubit/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
class PaymentWebView extends StatelessWidget {
  final String url;
  const PaymentWebView({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Secure Payment")),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(url))
          ..setNavigationDelegate(
           NavigationDelegate(
  onPageStarted: (String url) {
    print("Current Navigation URL: $url"); // ده أهم برنت دلوقتي
    
    // Paymob بيبعت success=true في الـ URL بعد ما البنك يخلص
    if (url.contains('success=true')) {
       // 1. ندي خبر للـ Cubit إن العملية نجحت
       context.read<PaymentCubit>().emitSuccess(); 
       // 2. نقفل الـ WebView ونرجع لصفحة الحجز
       Navigator.pop(context, true); 
    } else if (url.contains('success=false')) {
       context.read<PaymentCubit>().emitFailure("Payment Declined");
       Navigator.pop(context, false);
    }
  },
)
          ),
      ),
    );
  }
}