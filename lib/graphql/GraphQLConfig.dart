import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {

  static const String _host = '161.97.151.134:1337';

  static String getHost() {
    return "http://$_host";
  }

  static HttpLink httpLink = HttpLink(
    "http://$_host/graphql",
  );

  static AuthLink authLink = AuthLink(
    getToken: () async =>
        'Bearer 493fd3e368662c4427cc10b64762d09f7ca4f51433a631b4b8eaa0bbffae47579ff656a29537c1ff7a131ce7b2bef0ac6205e5c0ac789130a5f42f1a569545fb38aa1f97d9ad26a3f61b928de99960abbcf10bdb2679b2dc60934e2aab4374756f606ce6b749b294da13686acdcbf2e7c7140a50ac4cd7da8670fb66dcf433ee',
  );


  static Link link = authLink.concat(httpLink);

  static ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    ),
  );

  static ValueNotifier<GraphQLClient> clientToQuery() {
    return client;
  }
}
