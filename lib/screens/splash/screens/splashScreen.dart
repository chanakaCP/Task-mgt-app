import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  double _height = 90.h;
  double _width = 90.w;
  double _opacity = 1;

  @override
  void initState() {
    Timer(Duration(milliseconds: 2000), () {
      setState(() {
        _height = 1.h;
        _width = 1.w;
        _opacity = 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 600),
          opacity: _opacity,
          child: AnimatedContainer(
            child: Image.asset("assets/logo.jpg"),
            duration: Duration(milliseconds: 650),
            height: _height,
            width: _width,
          ),
        ),
      ),
    );
  }
}
