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
        altura
        peso
        foto {
          data {
            attributes {
              url
            }
          }
        }
        militar {
          data {
            attributes {
              promocion {
                data {
                  attributes {
                    gestion
                    nombre
                  }
                }
              }

              grado
              antiguedad
              carnet
              especialidad
              sangre
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
