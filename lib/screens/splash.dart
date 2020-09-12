import 'package:flutter/material.dart';
import 'package:mobile_developer_skill_testing/constant/color.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_screenutil/screenutil.dart';

class SplashPage extends StatefulWidget {
  final child;
  SplashPage({Key key,this.child});
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SplashScreen(
        seconds: 5,
        navigateAfterSeconds: widget.child,
        title: Text(
          'TEST SKILL MOBILE',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
        backgroundColor:  Color(0xFFf99a15),
        styleTextUnderTheLoader: TextStyle(color: Colors.deepPurple),
        photoSize: ScreenUtil().setHeight(350),
        loaderColor: Colors.white);
  }
}
