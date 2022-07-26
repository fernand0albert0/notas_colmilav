import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../graphql/GraphQLConfig.dart';
import '../../provider/menu_provider.dart';

class DatosPersonales extends StatefulWidget {
  const DatosPersonales({Key? key}) : super(key: key);

  @override
  State<DatosPersonales> createState() => _DatosPersonalesState();
}

class _DatosPersonalesState extends State<DatosPersonales> {
  @override
  Widget build(BuildContext context) {
    final datosProvider = Provider.of<MenuProvider>(context);

    String abreviacion() {
      switch (datosProvider.datosPersonales.grado) {
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
      if (datosProvider.datosPersonales.grado.contains("Cadete") ||
          datosProvider.datosPersonales.grado.contains("Brigadier") ||
          datosProvider.datosPersonales.grado.contains("Postulante")) {
        return false;
      } else {
        return true;
      }
    }

    Widget datos(String titulo, String informacion) {
      return Container(
        width: 30.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                child: Text(
              "$titulo : ",
              textScaleFactor: 1.2,
              style: TextStyle(fontFamily: "MontserratSemiBold"),
            )),
            Container(
                child: Text(
              informacion,
              style: TextStyle(fontFamily: "MontserratSemiBold"),
            ))
          ],
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 30.w,
          margin: EdgeInsets.symmetric(vertical: 3.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(GraphQLConfiguration.getHost() +
                    datosProvider.datosPersonales.foto),
                fit: BoxFit.contain),
          ),
        ),
        SizedBox(
          height: 30.h,
          width: 70.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 5.h,right: 20.w),
                width: 70.w,
                alignment: Alignment.center,
                child: Text(
                    "${abreviacion()} ${apellidos() ? ("${datosProvider.datosPersonales.nombre} ${datosProvider.datosPersonales.apellido_paterno} ${datosProvider.datosPersonales.apellido_materno}") : ("${datosProvider.datosPersonales.apellido_paterno} ${datosProvider.datosPersonales.apellido_materno} ${datosProvider.datosPersonales.nombre}")}",
                    textScaleFactor: 2.5,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontFamily: "MontserratExtraBold")),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      datos("Carnet de Identidad",
                          datosProvider.datosPersonales.carnet),
                      datos("Carnet Militar",
                          datosProvider.datosPersonales.carnet_militar),
                      datos(
                          "Especialidad",
                          datosProvider.datosPersonales.especialidad
                              .replaceAll("_", " ")),
                      datos( apellidos()?"Promocion": "Antiguedad",
                          apellidos()?  (  datosProvider.datosPersonales.promocion_gestion.toString()+" - "+datosProvider.datosPersonales.promocion_nombre  )  :datosProvider.datosPersonales.antiguedad.toString())
                    ],
                  ),
                  Column(
                    children: [
                      datos(
                          "Altura",
                          (datosProvider.datosPersonales.altura / 100)
                                  .toString() +
                              " m"),
                      datos(
                          "Peso",
                          (datosProvider.datosPersonales.peso / 10).toString() +
                              " Kg"),
                      datos(
                          "IMC",
                          ((datosProvider.datosPersonales.peso / 10) /
                                  ((datosProvider.datosPersonales.altura /
                                          100) *
                                      (datosProvider.datosPersonales.altura /
                                          100)))
                              .toStringAsPrecision(4)),
                      datos(
                          "Tipo de Sangre",
                          datosProvider.datosPersonales.sangre
                              .replaceAll("_", " ")
                              .replaceAll("Positivo", "+")
                              .replaceAll("Negativo", "-"))
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
