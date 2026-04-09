import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/core/services/service_locators.dart';
import 'package:car_rental/features/payment_process/data/model/payment_request_model.dart';
import 'package:car_rental/features/payment_process/domain/entities/payment_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:car_rental/features/payment_process/data/model/payment_response_model.dart';

abstract class PaymentRemoteDataSource {
  Future<PaymentResponseModel> getPaymentKeys(PaymentType paymentType);
  // this is method to verify the payment status after the user completes the payment process in the iframe, it will be called in the callback url that we set in the backend, and it will receive the orderId as a parameter to verify the payment status and return true if the payment is successful and false if it is not successful.
  Future<bool> verifyPaymentStatus(String orderId);
   
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final http.Client client;

  PaymentRemoteDataSourceImpl({required this.client});

  @override
  Future<PaymentResponseModel> getPaymentKeys(PaymentType paymentType) async {
    //this is the url of the backend endpoint that will return the payment keys (iframeUrl and token) based on the payment request data that we send in the body of the post request, we will use this data to open the iframe and complete the payment process.
    final url = Uri.parse('http://10.0.2.2:3000/getPaymentUrl');
    //get current user from firebase auth and pass the token in the header of the request for authentication and authorization, we will use the token to identify the user and return the payment keys based on the user's data and the payment request data.
final currentUser= await sl<FirebaseAuth>().currentUser;
//get the amount from booking details 

PaymentRequestModel requestModel = PaymentRequestModel(
  amount: 150,
  firstName: currentUser?.displayName ?? 'Ahmed',
  lastName: 'Elsaghier', // جرب تبعت قيمة ثابتة زي بوستمان للتست
  email: currentUser?.email ?? 'ahmed@example.com',
  phoneNumber: '+201020693291',
  paymentType: paymentType.name, // "card" أو "wallet"
);
final body = {
  "amount": 150,
  "firstName": "Ahmed",
  "lastName": "Elsaghier",
  "email": "ahmed@example.com",
  "phoneNumber": "+201020693291",
  "paymentType": paymentType.name // اتأكد إنها بتطبع "card" أو "wallet"
};
print(  "Payment Request Model: ${requestModel.toJson()}");
    try {
      final response = await client.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        //decode the response body to a Map and then convert it to PaymentResponseModel
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return PaymentResponseModel.fromJson(responseData);
      }else if (response.statusCode == 400) {
//if the data is not valid 
      throw InvalidInputException(); 
    } else if (response.statusCode == 404) {
      //if the endpoint is not found 
      throw NotFoundException();
    } else {

      throw ServerException();
    }
  } catch (e) {
    print("Payment Data Source Error: $e");
    throw ServerException();
  }

  }  
  @override
  Future<bool> verifyPaymentStatus(String orderId) {
    // TODO: implement verifyPaymentStatus
    throw UnimplementedError();
  }
}