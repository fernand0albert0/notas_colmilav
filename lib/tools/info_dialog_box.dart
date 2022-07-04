import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class InfoDialogBox extends StatefulWidget {
  final String title, descriptions, text;

  const InfoDialogBox(
      {required this.title, required this.descriptions, required this.text});

  @override
  _InfoDialogBoxState createState() => _InfoDialogBoxState();
}

class _InfoDialogBoxState extends State<InfoDialogBox> {
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
              top: constantsAvatarRadius, left: 0.h, right: 0.h),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(constantsPadding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black45,
                    spreadRadius: 1,
                    blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
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
                borderRadius:
                const BorderRadius.all(Radius.circular(constantsAvatarRadius)),
                child: Image.asset("images/app.png")),
          ),
        ),
      ],
    );
  }
}
