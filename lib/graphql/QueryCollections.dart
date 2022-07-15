class QueryCollections {



  String getContato(String carnet) {
    return """ 
query {
  personas(filters: { carnet: { contains: "$carnet" } }) {
    data {
      attributes {
        celular
        correo_personal
      }
    }
  }
}

  """;
  }


  String getDatosPersonales(String carnet) {
    return """ 
query {
  personas(filters: { carnet: { contains: "$carnet" } }) {
    data {
      attributes {
        nombre
        apellido_paterno
        apellido_materno
        carnet
        foto{
          data{
            attributes{
              url
            }
          }
        }
        militar{
          data{
            attributes{
              grado
              antiguedad
              carnet
              especialidad
            }
          }
        }
      }
    }
  }
}
  """;
  }

}
