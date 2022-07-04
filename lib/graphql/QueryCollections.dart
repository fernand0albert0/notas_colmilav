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

}
