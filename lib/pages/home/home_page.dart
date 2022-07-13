import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/menu_provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final datosProvider = Provider.of<MenuProvider>(context);
    return Scaffold(
      body: Center(
        child: Text("Bienvenidos " +datosProvider.carnet+ " al COLEGIO MILITAR DE AVIACION" ,textScaleFactor: 3,),
      ),
    );
  }
}
