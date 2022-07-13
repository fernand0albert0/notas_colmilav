import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../graphql/GraphQLConfig.dart';
import '../../graphql/QueryCollections.dart';
import '../../graphql/model/database.dart';
import '../../graphql/model/objetos.dart';
import '../../provider/menu_provider.dart';
import '../../tools/fail_connection.dart';
import '../../tools/info_dialog_box.dart';
import '../../tools/loading.dart';
import '../home/home_page.dart';
import 'package:http/http.dart' as http;

Future<bool> EnviarCodigo(String correo, String codigo) async {
  final response = await http
      .post(Uri.parse(GraphQLConfiguration.getHost() + "/api/email"), body: {
    "to": correo,
    "subject": "inicio de sesion",
    "text": "Tu codigo es : $codigo"
  });

  if (response.statusCode == 200) {
    print("Si se mando");
    return true;
  } else {
    return false;
  }
}

class LoginAcceso extends StatefulWidget {
  final String carnet;

  const LoginAcceso({
    required this.carnet,
  });

  @override
  State<LoginAcceso> createState() => _LoginAccesoState();
}

class _LoginAccesoState extends State<LoginAcceso> {
  late String codigo;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    late ConfirmationResult confirmar;
    final datosProvider = Provider.of<MenuProvider>(context);
    final codigoController = TextEditingController();
    final GlobalKey<FormState> formUserKey = GlobalKey<FormState>();
    return Query(
        options: QueryOptions(
            document: gql(QueryCollections().getContato(widget.carnet))),
        builder: (QueryResult result, {refetch, fetchMore}) {
          if (result.hasException) {
            return const Fail_Connection(
              descriptions: " ",
            );
          }

          if (result.isLoading) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                  color: const Color(0xff031B9A),
                  borderRadius: BorderRadius.circular(30)),
              child: Loading(),
            );
          }
          codigo = "123456";
          List<InicioSesion> resultado = DataBase().getIniforme(result);
          if (!resultado.isEmpty) {
            auth
                .signInWithPhoneNumber("+591" + resultado.first.celular)
                .then((confirmationResult) => {

                      confirmar = confirmationResult,

                    });

            EnviarCodigo(resultado.first.correo, codigo);
          } else {
            datosProvider.login = "inicio";
          }

          return Form(
              key: formUserKey,
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
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
                              fontFamily: "MontserratSemiBold",
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          "Codigo enviado al celular " +
                              resultado.first.celular,
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
                            controller: codigoController,
                            decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(color: Colors.white),
                                hintText: 'Introduzca codigo de verificacion'),
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
                      style:
                          ElevatedButton.styleFrom(primary: Color(0xffBFC5E0)),
                      onPressed: () {
                        if (formUserKey.currentState!.validate()) {
                          confirmar
                              .confirm(codigoController.text)
                              .then((result) => {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                HomePage()))
                                  });

                          if (codigo == codigoController.text) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => HomePage()));
                          }
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
        });
  }
}
