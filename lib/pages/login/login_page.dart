import 'package:flutter/material.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:notas/pages/login/login_form.dart';
import 'package:notas/provider/menu_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'login_acceso.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> getToken() async {
    String token = await GRecaptchaV3.execute('submit') ?? 'null returned';
  }

  @override
  Widget build(BuildContext context) {
    final datosProvider = Provider.of<MenuProvider>(context);

    Widget _loginFase() {
      switch (datosProvider.login) {
        case "inicio":
          {
            return const LoginForm();
          }

        default:
          {
            return LoginAcceso(
              carnet: datosProvider.carnet,
            );
          }
      }
    }

    return Stack(
      children: [
        SizedBox(
          height: 100.h,
          width: 100.w,
          child: Image.asset(
            "images/fondo.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 30.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          alignment: Alignment.center,
          child: const Text(
            "CONTROL DE NOTAS GRUPO CADETES",
            textScaleFactor: 2.5,
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: "MontserratExtraBold"),
          ),
        ),
        SizedBox(
          width: 100.w,
          height: 100.h,
          child: Row(
            children: [
              SizedBox(
                width: 50.w,
                height: 70.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 30.h,
                      child: Image.asset(
                        "images/logo.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      width: 30.w,
                      child: const Text(
                        "Colegio Militar de Aviacion ",
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: "MontserratSemiBold"),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      width: 30.w,
                      child: const Text(
                        "“Tgral. German bush Becerra”",
                        textScaleFactor: 1.5,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: "MontserratSemiBold"),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 50.w,
                height: 70.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30.w,
                      child: const Text(
                        "INICIO DE SESIÓN",
                        textScaleFactor: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: "MontserratExtraBold"),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),

                    _loginFase()

                    // LoginForm(),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
