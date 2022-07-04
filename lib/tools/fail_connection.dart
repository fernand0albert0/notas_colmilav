import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Fail_Connection extends StatefulWidget {
  final String descriptions;

  const Fail_Connection( {required this.descriptions});

  @override
  _Fail_ConnectionState createState() => _Fail_ConnectionState();
}

class _Fail_ConnectionState extends State<Fail_Connection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 1.h),
            child: Center(
              child: Image.asset(
                "images/logo.png",
                height: 10.h,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 0.5.h),
            child: const Text(
              "¡Ups! Algo salió mal",
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child:  Text(
              widget.descriptions,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
        ],
      ),
    );
  }
}
