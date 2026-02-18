import 'dart:convert';

import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/features/approval/data/model/license_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../../../core/services/service_locators.dart';
abstract class ApprovalRemoteDatasource{
  Future< String> SendOtp({required String phoneNumber});
  Future< Unit> verifyPhoneCode({
    required String verificationId,
    required String smsCode,
  });

  Future<String> uploadImage(String filePath);
  Future<String> pickImagePath();
  Future<LicenseModel> uploadImageToOcr();

}

class ApprovalRemoteDatasourceImpl implements ApprovalRemoteDatasource{
final _firebaseAuth=sl<FirebaseAuth>();



final ImagePicker picker;
ApprovalRemoteDatasourceImpl(this.picker);
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
    final filePath=await pickImagePath();
    const apiKey='ff546ae7a015175a04a2c5d885be4d39';
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
    throw  ImageNotSelectedException();
  }

  return image.path;
}
Future<LicenseModel> uploadImageToOcr() async {

 final filePath=await pickImagePath();

  var uri = Uri.parse("http://10.0.2.2:8000/ocr-finalize");
  var request = http.MultipartRequest("POST", uri);

  request.files.add(
    await http.MultipartFile.fromPath(
      "file",
      filePath,
    ),
  );

  var response = await request.send();

  if (response.statusCode == 200) {
    final responseBody = await response.stream.bytesToString();
    final Map<String, dynamic> json = jsonDecode(responseBody);
    if (json['status'] == 'success') {
      final Map<String, dynamic> licenseJson = json['ui_fields'];
      return LicenseModel.fromJson(licenseJson);
    } else {
      debugPrint('${json['status']}');
      throw ServerException();
    }
  }else{
    throw ServerException();

  }
  }
}
/*

@override
Future<String> recognizeTextFromImage(String imagePath) async {
try{

 final inputImage = InputImage.fromFilePath(imagePath);

  final RecognizedText recognizedText =
  await _textRecognizer.processImage(inputImage);

  return recognizedText.text;

}catch(e){
  throw OcrProcessingException();
}

}

void dispose() {
  _textRecognizer.close();
}
*/

