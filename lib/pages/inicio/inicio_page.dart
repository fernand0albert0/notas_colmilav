import 'package:flutter/material.dart';
import 'package:notas/pages/inicio/datos_personales.dart';
import 'package:sizer/sizer.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();

    String _mes(int mes) {
      switch (mes) {
        case 1:
          {
            return "Enero";
          }
        case 2:
          {
            return "Febrero";
          }
        case 3:
          {
            return "Marzo";
          }
        case 4:
          {
            return "Abril";
          }
        case 5:
          {
            return "Mayo";
          }
        case 6:
          {
            return "Junio";
          }
        case 7:
          {
            return "Julio";
          }
        case 8:
          {
            return "Agosto";
          }
        case 9:
          {
            return "Septiembre";
          }
        case 10:
          {
            return "Octubre";
          }
        case 11:
          {
            return "Noviembre";
          }

        default:
          {
            return "Diciembre";
          }
      }
    }

    return Container(
      height: 100.h,
      width: 100.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/fondo-azul.png"), fit: BoxFit.cover)),
      child: Column(
        children: [
          SizedBox(
            width: 100.w,
            height: 20.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 5.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        child: Text(
                          "SIGN - EDRON EFD",
                          textScaleFactor: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "MontserratSemiBold",
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const SizedBox(
                        child: Text(
                          "Historial de Notas",
                          textScaleFactor: 1.2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "MontserratSemiBold",
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        child: Text(
                          now.day.toString() +
                              " de  " +
                              _mes(now.month) +
                              " del " +
                              now.year.toString(),
                          textScaleFactor: 1.2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "MontserratSemiBold",
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 12.h,
                        child: Image.asset(
                          "images/logo.png",
                        ),
                      ),
                      const SizedBox(
                        child: Text(
                          "Colegio Militar de Aviacion ",
                          textScaleFactor: 1.2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "MontserratSemiBold",
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      const SizedBox(
                        child: Text(
                          "“Tgral. German bush Becerra”",
                          textScaleFactor: 1.2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "MontserratSemiBold",
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 80.h,
            width: 100.w,

            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),),
            ),
            child: Column(
              children: [
                Container(
                  height: 30.h,
                  child: DatosPersonales(),

                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
