import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


class MainAppTopBar extends StatelessWidget {
  final String title;

  MainAppTopBar({Key key, this.title = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    var username = Auth.getAuthData()["username"];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(18), bottomRight: Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
        gradient: LinearGradient(
          colors: [
            // ColorsConstants.indigo,
            // ColorsConstants.robinEggBlue,
            Color(0xFFf99a15),
            Color(0xFFf7b457),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: ScreenUtil().setHeight(10), left: ScreenUtil().setWidth(10), right: ScreenUtil().setWidth(10), bottom: ScreenUtil().setWidth(15)),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil().setHeight(5),
                    ),
                    Text('SME',style:TextStyle(fontSize: ScreenUtil().setSp(70),color: Colors.white),),
                  ],
                ),
                Row(children: <Widget>[
                  Text('Mobile Developer',style:TextStyle(fontSize: ScreenUtil().setSp(40),color: Colors.white)),
                  SizedBox(width: 15,),
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage('https://images.pexels.com/photos/936229/pexels-photo-936229.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
                  )
                ],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
