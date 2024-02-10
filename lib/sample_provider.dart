
import 'package:flutter/foundation.dart';

class SampleProvider with ChangeNotifier{
  int _count = 50;
  int get count => _count;

  void setValue(){
    _count++;
    notifyListeners();
  }
}