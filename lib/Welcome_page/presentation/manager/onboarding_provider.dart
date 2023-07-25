
import 'package:flutter/material.dart';

import '../../../helper/shared_pref_controller.dart';


class OnBoardingProvider extends ChangeNotifier {
  bool value = false;
  String lang = "ar";

  bool isChecked() {
    return value;
  }

  void setCheckValue(value) {
    this.value = value;
    notifyListeners(); // Notify listeners of the state change
  }

  void setLang(String lang) {
    this.lang = lang;
    SharedPerf().save(lang: this.lang);
    notifyListeners(); // Notify listeners of the state change
  }

  String getLang() {
    // Retrieve the language from shared preferences and update the lang variable
    lang = SharedPerf().lang;
    return lang;
  }
}
