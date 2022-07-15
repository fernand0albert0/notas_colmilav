import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:notas/pages/home/menu.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../graphql/GraphQLConfig.dart';
import '../../graphql/QueryCollections.dart';
import '../../graphql/model/database.dart';
import '../../graphql/model/objetos.dart';
import '../../provider/menu_provider.dart';
import '../../tools/fail_connection.dart';
import '../../tools/loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final datosProvider = Provider.of<MenuProvider>(context);

    Widget menu(String foto, String grado, String nombre,
        String apellido_paterno, String apellido_materno) {
      Widget subMenu(String titulo, IconData icono) {
        return ElevatedButton(
            onPressed: () {
              datosProvider.menu = titulo;
              datosProvider.drawerController.toggle?.call();
            },
            style: ElevatedButton.styleFrom(
              primary: datosProvider.menu == titulo
                  ? Colors.amber
                  : Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 2.h),
                width: 20.w,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          icono,
                          size: 5.h,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Expanded(
                            child: Text(
                          titulo.toUpperCase(),
                          textScaleFactor: 1.2,
                          style: TextStyle(
                              color: Color(0xff1D295D),
                              fontFamily: "MontserratExtraBold"),
                        ))
                      ],
                    ),
                    Container(
                      height: 0.2.h,
                      width: 20.w,
                      color: Colors.grey,
                    )
                  ],
                )));
      }

      String abreviacion() {
        switch (grado) {
          case "Postulante":
            {
              return "Post";
            }
          case "Cadete_Primero_Ano":
            {
              return "Cdte. I";
            }
          case "Cadete_Segundo_Ano":
            {
              return "Cdte. II";
            }
          case "Cadete_Tercer_Ano":
            {
              return "Cdte. III";
            }
          case "Cadete_Cuarto_Ano":
            {
              return "Cdte. IV";
            }

          case "Sub-Brigadier":
            {
              return "Sbrig";
            }
          case "Brigadier":
            {
              return "Brig";
            }
          case "Brigadier_Mayor":
            {
              return "Brig. My.";
            }

          case "Subteniente":
            {
              return "Sbtte.";
            }
          case "Teniente":
            {
              return "Tte.";
            }
          case "Capitán":
            {
              return "Cap.";
            }

          case "Mayor":
            {
              return "My.";
            }
          case "Teniente_Coronel":
            {
              return "Tcnl.";
            }
          case "Coronel":
            {
              return "Cnl.";
            }

          case "General_de_Brigada":
            {
              return "Gral. Brig.";
            }
          case "General_de_División":
            {
              return "Gral. Div.";
            }

          default:
            {
              return "Gral. Fza.";
            }
        }
      }

      bool apellidos() {
        if (grado.contains("Cadete") ||
            grado.contains("Brigadier") ||
            grado.contains("Postulante")) {
          return false;
        } else {
          return true;
        }
      }

      return Container(
        height: 100.h,
        width: 20.w,
        decoration: const BoxDecoration(
          color: Color(0xffF1F1F1),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50.0),
          ),
        ),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 3.h),
              height: 20.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(GraphQLConfiguration.getHost() + foto),
                    fit: BoxFit.contain),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2.h),
              padding: EdgeInsets.symmetric(horizontal: 1.5.w),
              width: 20.w,
              alignment: Alignment.center,
              child: Text(
                  abreviacion() +
                      " " +
                      (apellidos()
                          ? (nombre +
                              " " +
                              apellido_paterno +
                              " " +
                              apellido_materno)
                          : (apellido_paterno +
                              " " +
                              apellido_materno +
                              " " +
                              nombre)),
                  textScaleFactor: 1.4,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "MontserratExtraBold")),
            ),
            subMenu("Inicio", Icons.home_outlined),

            subMenu("Salir", Icons.home_outlined),
          ],
        ),
      );
    }

    Widget home() {
      final menuProvider = Provider.of<MenuProvider>(context);

      return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              menuProvider.drawerController.toggle?.call();
            },
          ),

        ),
        body: Container(
          height: 100.h,
          color: Colors.white,
          child: Menu(),
        ),
      );
    }

    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Query(
          options: QueryOptions(
              document: gql(
                  QueryCollections().getDatosPersonales(datosProvider.carnet))),
          builder: (QueryResult result, {refetch, fetchMore}) {
            if (result.hasException) {
              return const Fail_Connection(
                descriptions: "No se encontro al Oficial",
              );
            }

            if (result.isLoading) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                width: 30.w,
                height: 30.h,
                child: Loading(),
              );
            }
            Persona resultado = DataBase().getPersona(result);

            return Stack(
              fit: StackFit.passthrough,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff263E80), Color(0xff263E80)],
                          stops: [0.1, 0.5],
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight)),
                  child: Opacity(
                    opacity: 0.5,
                    child: SizedBox(
                      width: 100.w,
                      height: 100.h,
                      child: Image.asset(
                        'images/fondo-azul.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ZoomDrawer(
                  dragOffset: 200,
                  mainScreenScale: 0,
                  androidCloseOnBackTap: false,
                  mainScreenTapClose: true,
                  menuScreenTapClose: false,
                  disableDragGesture: true,
                  controller: datosProvider.drawerController,
                  style: DrawerStyle.defaultStyle,
                  menuScreen: menu(
                      resultado.foto,
                      resultado.grado,
                      resultado.nombre,
                      resultado.apellido_paterno,
                      resultado.apellido_materno),
                  mainScreen: home(),
                  borderRadius: 24.0,
                  showShadow: true,
                  angle: 0.0,
                  menuBackgroundColor: Colors.transparent,
                  slideWidth: 20.w,
                  openCurve: Curves.decelerate,
                  closeCurve: Curves.decelerate,
                )
              ],
            );
          }),
    );
  }
}
