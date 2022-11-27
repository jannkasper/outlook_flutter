
import 'package:flutter/material.dart';
import 'package:outlook_flutter/model/email.model.dart';

class EmailProvider extends ChangeNotifier {

  final List<EmailModel> _emailList = emailList;
  int _selectedIndex = 0;

  List<EmailModel> get emails => _emailList;
  EmailModel get email => _emailList[_selectedIndex];
  int get selectedIndex => _selectedIndex;

  void setEmail(int index) {
    _selectedIndex = index;
    _emailList[index].isChecked = true;
    notifyListeners();
  }
}