import 'package:flutter/material.dart';
import 'package:notas/pages/deporte/deporte_page.dart';
import 'package:notas/pages/inicio/inicio_page.dart';
import 'package:notas/pages/home/salir.dart';
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
        case "INICIO":
          {
            return const InicioPage();
          }

        case "EDUCACION FISICA Y DEPORTES":
          {
            return const DeportePage();
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
