import 'package:equatable/equatable.dart';
class PaymentResponseEntity extends Equatable {
  final String? iframeUrl;
  final String? token;
  final String? orderId;
  final String? paymentType;
  final String? redirectUrl;

  PaymentResponseEntity({
     this.iframeUrl,
     this.token,
    this.orderId,
    this.paymentType,
    this.redirectUrl
  });

  @override
  List<Object?> get props => [iframeUrl, token, orderId, paymentType, redirectUrl];
}
