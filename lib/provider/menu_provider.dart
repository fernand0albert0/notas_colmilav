import 'package:flutter/cupertino.dart';


class MenuProvider with ChangeNotifier {
  Widget _body =  Container();

  Widget get body {
    return _body;
  }

  set body(Widget valor) {
    _body = valor;
    notifyListeners();
  }

  String _login = "inicio";

  String get login  {
    return _login ;
  }

  set login (String valor) {
    _login  = valor;
    notifyListeners();
  }


  String _carnet = " ";

  String get carnet  {
    return _carnet;
  }

  set carnet (String valor) {
    _carnet = valor;
    notifyListeners();
  }







}
