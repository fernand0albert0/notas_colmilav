import 'package:graphql_flutter/graphql_flutter.dart';

import 'objetos.dart';

class DataBase {
  List<InicioSesion> getIniforme(QueryResult result) {
    List data = result.data!["personas"]["data"];
    List<InicioSesion> resultado = [];
    for (var element in data) {
      resultado.add(InicioSesion(element["attributes"]["celular"],
          element["attributes"]["correo_personal"]));
    }

    return resultado;
  }

  Persona getPersona(QueryResult result) {
    List data = result.data!["personas"]["data"];
    List<Persona> resultado = [];
    for (var element in data) {
      resultado.add(Persona(
        element["attributes"]["nombre"],
        element["attributes"]["apellido_paterno"],
        element["attributes"]["apellido_materno"],
        element["attributes"]["carnet"],
        element["attributes"]["altura"],
        element["attributes"]["peso"],
        element["attributes"]["foto"]["data"]["attributes"]["url"],



        element["attributes"]["militar"]["data"]["attributes"]["promocion"]["data"]["attributes"]["gestion"],
        element["attributes"]["militar"]["data"]["attributes"]["promocion"]["data"]["attributes"]["nombre"],


        element["attributes"]["militar"]["data"]["attributes"]["grado"],
        element["attributes"]["militar"]["data"]["attributes"]["antiguedad"],
        element["attributes"]["militar"]["data"]["attributes"]["carnet"],
        element["attributes"]["militar"]["data"]["attributes"]["especialidad"],
        element["attributes"]["militar"]["data"]["attributes"]["sangre"],
      ));
    }

    return resultado.first;
  }
}
