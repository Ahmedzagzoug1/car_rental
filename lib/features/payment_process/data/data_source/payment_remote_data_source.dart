import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/features/payment_process/data/model/payment_request_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:car_rental/features/payment_process/data/model/payment_response_model.dart';

abstract class PaymentRemoteDataSource {
  Future<PaymentResponseModel> getPaymentKeys(PaymentRequestModel request);
  // this is method to verify the payment status after the user completes the payment process in the iframe, it will be called in the callback url that we set in the backend, and it will receive the orderId as a parameter to verify the payment status and return true if the payment is successful and false if it is not successful.
  Future<bool> verifyPaymentStatus(String orderId);
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final http.Client client;

  PaymentRemoteDataSourceImpl({required this.client});

  @override
  Future<PaymentResponseModel> getPaymentKeys(PaymentRequestModel request) async {
    //this is the url of the backend endpoint that will return the payment keys (iframeUrl and token) based on the payment request data that we send in the body of the post request, we will use this data to open the iframe and complete the payment process.
    final url = Uri.parse('http://10.0.2.2:3000/getPaymentUrl');

    try {
      final response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        //decode the response body to a Map and then convert it to PaymentResponseModel
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return PaymentResponseModel.fromJson(responseData);
      }else if (response.statusCode == 400) {
      // لو البيانات اللي مبعوتة للسيرفر غلط (زي مشكلة الـ street اللي ظهرت قبل كدا)
      throw InvalidInputException(); 
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      // أي خطأ تاني من ناحية السيرفر (500 مثلاً)
      throw ServerException();
    }
  } catch (e) {
    // لو مفيش إنترنت أو السيرفر مش شغال أصلاً (SocketException)
    throw ServerException();
  }
  
  @override
  Future<bool> verifyPaymentStatus(String orderId) {
    // TODO: implement verifyPaymentStatus
    throw UnimplementedError();
  }
}