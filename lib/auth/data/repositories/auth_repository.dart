import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lobor/helper/componet/Helpers.dart';
import 'package:lobor/home/presentation/pages/main_screen.dart';
import '../../presentation/pages/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AuthRepository {

  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future otpConfirm(smsCode,context)async{
    try{
      PhoneAuthCredential credential = PhoneAuthProvider.
      credential(verificationId:LoginScreen.verify, smsCode: smsCode);
      await auth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(context,MainScreen.route, (route) => false);
    }catch (e){
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:Text("$e")
          )
      );

    }
  }

  Future getVerifyCode(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+$phoneNumber',
      codeSent: (String verificationId, int? resendToken) async {
        LoginScreen.verify=verificationId;
      },
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        await auth.signInWithCredential(phoneAuthCredential);
      },
      verificationFailed: (FirebaseAuthException error) {
        if (error.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {  },
    );
  }

  Future saveUserInfo({required fullName,required phone, required result}) async{
    fireStore.collection('users').
    doc(result.uid).
    set({
      'name':fullName,
      'phone':phone
    });

  }

  Future signOut() async {
    await auth.signOut();
    print(auth.currentUser);
  }

  Future signInWithCredential(PhoneAuthCredential credential,context) async {
    try {
      await auth.signInWithCredential(credential);
    } catch (e) {
      Helpers.ShowSnackBar(context: context, massage:"please try again!");
    }
  }

  bool getCurrentLogin () {
   User? currentUser = auth.currentUser;
    return currentUser != null;
}
}
