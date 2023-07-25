

import 'package:flutter/cupertino.dart';
import '../../data/repositories/profile_repository.dart';

class ProfileController extends ChangeNotifier{
  late   ProfileRepository profileRepository;
  ProfileController(this.profileRepository);

  Future sendMassage({required fullName, required  phone,required  massage}) async
  {
    profileRepository.sendMassage(fullName: fullName, phone: phone, massage: massage);
  }
}