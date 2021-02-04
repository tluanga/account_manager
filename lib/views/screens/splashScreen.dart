import 'dart:async';
import 'package:account_manager/static/constants.dart';
import 'package:account_manager/views/screens/myApp.screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => MyApp()
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      color: cprimaryColor,
                      child: Text('ACCOUNTING APP',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: 30, height: 10)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        color: Colors.white,
                        child: CustomPaint(
                          child: Text(
                            'MZU Incubation Centre',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25, height: 5, color: Colors.black),
                          ),
                          painter: AKualLai(),
                        )),
                  )
                ]),
          ),
        ));
  }
}

class AKualLai extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = cprimaryColor;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    var path = Path();

    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(
        size.width * 0, size.height * 0.001, size.width * 0.4, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
