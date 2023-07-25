


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ProcessController extends ChangeNotifier
{
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  final CollectionReference ordersCollection =
  FirebaseFirestore.instance.collection('orders');


  Future<void> addOrder(String company_id ,date) {
    DocumentReference serviceRef =
    FirebaseFirestore.instance.collection('Companies').doc(company_id);
    return ordersCollection.doc().set({
     'startDate': date,
      'serviceReference':serviceRef,
      'status':'onGoing'// Store the reference
  });
  }
  late String CompanyId;
  Future<void> setCompanyId(company_id) async {

        this.CompanyId =company_id ;
        print('Document ID: $CompanyId');
        ChangeNotifier();

  }


}
