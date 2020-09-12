
import 'package:flutter/cupertino.dart';
import 'package:mobile_developer_skill_testing/screens/dashBord.dart';
import 'package:mobile_developer_skill_testing/screens/splash.dart';
import 'package:mobile_developer_skill_testing/widgets/mainContainer.dart';

class MainRouter {
  Map<String, WidgetBuilder> createRouter() {
    Map<String, WidgetBuilder> router = {
      '/': (context) => SplashPage(
        child:MainContainer(child: DashBord(),),
      ),
    };
    return router;
  }
}
