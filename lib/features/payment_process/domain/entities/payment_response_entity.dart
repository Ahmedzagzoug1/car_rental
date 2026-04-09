import 'package:equatable/equatable.dart';
class PaymentResponseEntity extends Equatable {
  final String? iframeUrl;
  final String? token;
  final int? orderId;
  final String? paymentType;
  final String? redirectUrl;

  const PaymentResponseEntity({
     this.iframeUrl,
     this.token,
    this.orderId,
    this.paymentType,
    this.redirectUrl
  });

  @override
  List<Object?> get props => [iframeUrl, token, orderId, paymentType, redirectUrl];
}
