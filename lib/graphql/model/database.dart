import 'package:graphql_flutter/graphql_flutter.dart';

import 'objetos.dart';

class DataBase {
  List<InicioSesion> getIniforme(QueryResult result) {
    List data = result.data!["personas"]["data"];
    List<InicioSesion> resultado = [];
    for (var element in data) {
      resultado.add(
          InicioSesion(
              element["attributes"]["celular"],
          element["attributes"]["correo_personal"]));
    }

    return resultado;
  }
}
