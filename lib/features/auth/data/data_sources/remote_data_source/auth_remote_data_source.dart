import 'package:car_rental/core/error/exceptions.dart';
import 'package:car_rental/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../../core/services/service_locators.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmail({
    required String name,
    required String email,
    required String password,
    String? phone,
  });

  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  });

  Future< String> signInWithPhone({required String phoneNumber}); // returns verificationId

  Future<Unit> verifyPhoneCode({
    required String verificationId,
    required String smsCode,
  });

  Future< UserModel?> getCurrentUser();

  Future<Unit> saveUserData(UserModel user);

  Future< Unit> upgradeToHost();

  Future< Unit> signOut();
  Future<String?> getToken();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth=sl<FirebaseAuth>();
  final FirebaseFirestore _firestore=sl<FirebaseFirestore>();
final _secureStorage=sl<FlutterSecureStorage>();
  AuthRemoteDataSourceImpl();

  @override
  Future< UserModel> signUpWithEmail({
    required String name,
    required String email,
    required String password,
    String? phone,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        phone: phone,
        createdAt: DateTime.now(),
        isHost: false,
        drivingLicenseVerified: false,
        isEmailVerified: false,
        profileImage: 'NotFound'
      );

      await saveUserData(user);
      _saveToken();
      return user;
    } on FirebaseAuthException catch(e){
      throw FirebaseAuthException(code:  e.code);
    }
    catch (e) {
      throw Exception( e.toString());
    }
  }

  @override
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user =await getCurrentUser();

      _saveToken();
      return  user!;
    } catch (e) {
      throw FirebaseAuthException(code: e.toString());
    }
  }

  @override
  Future< String> signInWithPhone({required String phoneNumber}) async {
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
        codeAutoRetrievalTimeout: (String verId) {},
      );
      return verificationId;
    } catch (e) {
      throw FirebaseAuthException(code: e.toString());
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
      _saveToken();
      return unit;
    } catch (e) {
      throw FirebaseAuthException(code: e.toString());
    }
  }

  @override
  Future< UserModel?> getCurrentUser() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) return null;

      final snapshot = await _firestore.collection('users').doc(user.uid).get();
      if (!snapshot.exists) return null;

      final data = snapshot.data()!;
      return UserModel(
        id: user.uid,
        name: data['name'],
        email: data['email'],
        phone: data['phone'], createdAt: data['createdAt'],
        profileImage: data['profileImage'],isHost: data['isHost'],isEmailVerified: data['isEmailVerified'],
        drivingLicenseVerified: data['drivingLicenseVerified']
      );
    } catch (e) {
      throw ServerException( );
    }
  }

  @override
  Future< Unit> saveUserData(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).set({
        'name': user.name,
        'email': user.email,
        'phone': user.phone,
        'createdAt':user.createdAt,
        'role':'rent',

      });
      return unit;
    } catch (e) {
     throw ServerException();
    }
  }

  @override
  Future< Unit> upgradeToHost() async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) throw UserNotFoundException();
      await _firestore.collection('users').doc(user.uid).update({'role': 'host'});
      return unit;
    } catch (e) {
     throw ServerException();
    }
  }

  @override

  Future< Unit> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return unit;
    } catch (e) {
throw ServerException();
    }
  }
  Future<void> _saveToken() async {
    final user = _firebaseAuth.currentUser;
    if (user != null) {
      final idToken = await user.getIdToken(); // Firebase JWT
      await _secureStorage.write(key: 'jwt_token', value: idToken);
    }
  }
  @override
  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'jwt_token');
  }

}