

import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileRepository{
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  Future<void> sendMassage({required String fullName, required String phone,required String massage}) async {
    try {
      await fireStore.collection('massages').doc().set({
        'name': fullName,
        'phone': phone,
        'massage': massage,
      });
      print('User info saved successfully!');
    } catch (e) {
      print('Error saving user info: $e');
    }
  }
  Future<void> sendAddress({required String city, required String building,required String street,required String area}) async {
    try {
      await fireStore.collection('addresses').doc().set({
        'city': city,
        'building': building,
        'street': street,
        'area': area,
      });
      print('User info saved successfully!');
    } catch (e) {
      print('Error saving user info: $e');
    }
  }

}