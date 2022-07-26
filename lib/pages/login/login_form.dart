import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:notas/pages/login/login_acceso.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../provider/menu_provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final datosProvider = Provider.of<MenuProvider>(context);
    final carnetController = TextEditingController();
    final GlobalKey<FormState> formUserKey = GlobalKey<FormState>();

    return Form(
        key: formUserKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
              width: 30.w,
              decoration: BoxDecoration(
                  color: const Color(0xff031B9A),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Acceso",
                    textAlign: TextAlign.left,
                    textScaleFactor: 1.3,
                    style: TextStyle(
                        fontFamily: "MontserratSemiBold", color: Colors.white),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const Text(
                    "Usuario (ej: 12345678)",
                    textAlign: TextAlign.left,
                    textScaleFactor: 1.3,
                    style: TextStyle(
                        fontFamily: "MontserratMediumItalic",
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: carnetController,
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: 'Introduzca su Carnet de Identidad'),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "* Requerido"),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: const Color(0xffBFC5E0)),
                onPressed: () {
                  if (formUserKey.currentState!.validate()) {

                    datosProvider.carnet=carnetController.text;
                    datosProvider.login = "esperando";
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 5.h,
                  width: 10.w,
                  child: const Text(
                    "INICIAR",
                    textScaleFactor: 1.3,
                    style: TextStyle(
                        color: Color(0xff1D295D),
                        fontFamily: "MontserratExtraBold"),
                  ),
                ))
          ],
        ));
  }
}
