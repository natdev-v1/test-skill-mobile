
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mobile_developer_skill_testing/constant/color.dart';

import 'mainAppTopBar.dart';


class MainContainer extends StatelessWidget {
  final String title;
  final child;

  const MainContainer({Key key, this.title = "", this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(85),
          child: MainAppTopBar(title:'คดีที่ 1582/2560'),
        ),
        body: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: child),
              )
            ],
          ),
        ));
  }
}
