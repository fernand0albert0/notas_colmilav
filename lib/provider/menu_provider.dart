import 'package:flutter/cupertino.dart';
import 'package:flutter_zoom_drawer/config.dart';


class MenuProvider with ChangeNotifier {
  String _menu = "Inicio";

  String get menu {
    return _menu;
  }

  set menu(String valor) {
    _menu = valor;
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


  String _carnet = "9768790";

  String get carnet  {
    return _carnet;
  }

  set carnet (String valor) {
    _carnet = valor;
    notifyListeners();
  }

  ZoomDrawerController _drawerController = ZoomDrawerController();


  ZoomDrawerController get drawerController {
    return _drawerController;
  }

  set drawerController(ZoomDrawerController valor) {
    _drawerController = valor;
    notifyListeners();
  }








}
