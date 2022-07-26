import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Bounce(
              infinite: true,
              child: Image.asset(
                "images/logo.png",
                height: 10.h,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 40.w),
            child: const LinearProgressIndicator(
              color: Colors.amber,
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
