import 'dart:async';
import 'package:flutter/material.dart';
import '../../data/repositories/auth_repository.dart';



class AuthController extends ChangeNotifier{
    late  AuthRepository authRepository;
    AuthController(this.authRepository);


  Future getCodeConfirm(String code,context)async{
    authRepository.otpConfirm(code , context);

  }

  Future getVerifiedCode( String phoneNumber)  async{
    authRepository.getVerifyCode(phoneNumber );

  }

  Future saveUserInfo({required fullName,required phone ,required result})async{
    authRepository.saveUserInfo(fullName:fullName,phone:phone, result: result,);

  }

  Future signOut() async {
    authRepository.signOut();

  }

    bool getCurrentLogin()   {
      return   authRepository.getCurrentLogin();
    }

}
