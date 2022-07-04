import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {

  static const String _host = 'localhost:1337';

  static String getHost() {
    return "http://$_host";
  }

  static HttpLink httpLink = HttpLink(
    "http://$_host/graphql",
  );

  static AuthLink authLink = AuthLink(
    getToken: () async =>
        'Bearer 5510d179dad60dead1a947f42208ba063d738099adcef87842523b1419fb20c20484d1a3350efeeaee4da5ce46a30439d873bb96a85bdb15c185a8a2c506d9d76a55a06a735771e0341c970a68c069dddfc1581c18feed4c29d3f5216da24b290f4a385286996394feaafc9d54f33a376972bd74dfc32b3a2b9dcd132c9be7be',
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
