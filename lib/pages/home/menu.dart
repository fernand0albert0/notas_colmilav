import 'package:flutter/material.dart';
import 'package:notas/pages/home/inicio.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../provider/menu_provider.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    Widget menu() {
      switch (menuProvider.menu) {
        case "Inicio":
          {
            return const Inicio();
          }
        case "Salir":
          {
            return Container(
              color: Colors.amber,
            );
          }

        default:
          {
            return Container();
          }
      }
    }

    return Container(
      color: Colors.white,
      height: 89.h,
      width: 100.w,
      child: menu(),
    );
  }
}
