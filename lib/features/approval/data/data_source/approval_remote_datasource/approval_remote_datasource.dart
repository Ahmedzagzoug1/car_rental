import 'dart:convert';

import 'package:car_rental/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../../core/services/service_locators.dart';
abstract class ApprovalRemoteDatasource{
  Future< String> SendOtp({required String phoneNumber});
  Future< Unit> verifyPhoneCode({
    required String verificationId,
    required String smsCode,
  });

  Future<String> uploadImage(String filePath);
  Future<String> pickImagePath();
  Future<String> scanImage(String imagePath);


}

class ApprovalRemoteDatasourceImpl implements ApprovalRemoteDatasource{
final _firebaseAuth=sl<FirebaseAuth>();
final MobileScannerController controller;
final ImagePicker picker;
ApprovalRemoteDatasourceImpl(this.controller, this.picker);
  @override
  Future< String> SendOtp({required String phoneNumber}) async {
    try {
      String verificationId = '';
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw e;
        },
        codeSent: (String verId, int? resendToken) {
          verificationId = verId;
        },
        codeAutoRetrievalTimeout: (String verId) {

        },
        timeout: const Duration(seconds: 60),

      );
      return verificationId;
    } on FirebaseAuthException {
      throw FirebaseAuthException(code: 'Firebase Auth ');
    }on ServerException{
      throw ServerException();
    }
  }

  @override
  Future< Unit> verifyPhoneCode({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _firebaseAuth.signInWithCredential(credential);
      return unit;
    } catch (e) {
      throw FirebaseAuthException(code: e.toString());
    }
  }

@override
Future<String> uploadImage(String filePath) async {
    final apiKey='ff546ae7a015175a04a2c5d885be4d39';
  final url = Uri.parse("https://api.imgbb.com/1/upload?key=$apiKey");
  http.MultipartRequest request = http.MultipartRequest('POST', url);
  request.files.add(await http.MultipartFile.fromPath('image', filePath));
  var response = await request.send();
  var respStr = await response.stream.bytesToString();
    Map<String,dynamic> data = jsonDecode(respStr) as Map<String,dynamic>;

  if (response.statusCode == 200) {

     String url=data['url'] ??'';
    return url;
  } else {
    throw ImageNotUploadException();
  }
}
@override
Future<String> pickImagePath() async {
  final image = await picker.pickImage(source: ImageSource.gallery);

  if (image == null) {
    throw const ImageNotSelectedException();
  }

  return image.path;
}

@override
Future<String> scanImage(String imagePath) async {
  try {
    final capture = await controller.analyzeImage(imagePath);

    if (capture == null || capture.barcodes.isEmpty) {
      throw const QrScanException('No QR code found in image');
    }

    return capture.barcodes.first.rawValue ?? '';
  } catch (e) {
    throw const QrScanException();
  }
}
}