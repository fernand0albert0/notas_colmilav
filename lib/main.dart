import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:g_recaptcha_v3/g_recaptcha_v3.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:notas/pages/home/home_page.dart';
import 'package:notas/pages/login/login_page.dart';
import 'package:notas/provider/menu_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'graphql/GraphQLConfig.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  if (kIsWeb) {
    GRecaptchaV3.ready("6LesgaogAAAAACvxESX0hOXKbPShd5GQbwegGk4S");
  }

  runApp(
    MyApp(),
  );
}

//Amarillo: F4CB44
//Azul: 263E80
//Azul Claro: 005F92

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MenuProvider()),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return GraphQLProvider(
          client: GraphQLConfiguration.clientToQuery(),
          child: MaterialApp(
            title: "SISTEMA DE NOTAS COLMILAV",
            scrollBehavior: const ScrollBehavior().copyWith(
                physics: const BouncingScrollPhysics(),
                scrollbars: false,
                overscroll: false),
            theme: ThemeData(
              fontFamily: 'MontserratRegular',
            ),
            debugShowCheckedModeBanner: false,
            home: const Scaffold(
              backgroundColor: Colors.white,
              body: LoginPage(),
            ),
          ),
        );
      }),
    );
  }
}
