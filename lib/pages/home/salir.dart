import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notas/main.dart';
import 'package:notas/pages/login/login_page.dart';
import 'package:sizer/sizer.dart';

class Salir extends StatefulWidget {
  final String title, descriptions, text;

  const Salir(
      {required this.title, required this.descriptions, required this.text});

  @override
  _SalirState createState() => _SalirState();
}

class _SalirState extends State<Salir> {
  static const double constantsPadding = 20;
  static const double constantsAvatarRadius = 45;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(constantsPadding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: constantsPadding,
              top: constantsAvatarRadius + constantsPadding,
              right: constantsPadding,
              bottom: constantsPadding),
          margin: EdgeInsets.only(
              top: constantsAvatarRadius, left: 30.w, right: 30.w),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(constantsPadding),
              boxShadow: const []),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    autofocus: true,
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff263E80),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => MyApp()));
                    },
                    child: Text(
                      widget.text,
                      style:
                          const TextStyle(fontFamily: "MontserratMediumItalic"),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: constantsPadding,
          right: constantsPadding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: constantsAvatarRadius,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(0)),
                child: Image.asset("images/logo.png")),
          ),
        ),
      ],
    );
  }
}
