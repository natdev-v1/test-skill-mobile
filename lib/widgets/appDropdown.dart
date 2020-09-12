import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropdown extends StatelessWidget {
  final value;
  @required
  final onChanged;
  @required
  final List<Map<String,dynamic>> items;
  AppDropdown({Key key, this.value, this.onChanged,this.items});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      icon: Icon(Icons.arrow_downward),
      iconSize: ScreenUtil().setSp(40),
      elevation: 16,
      style: TextStyle(color: Color(0xFFf7b457),fontSize:  ScreenUtil().setSp(30)),
      underline: Container(
        height: 2,
        color: Color(0xFFf99a15),
      ),
      onChanged: (String newValue) {
        onChanged(newValue);
      },
      items: this.items
          .map<DropdownMenuItem<String>>((Map<String,dynamic> data) {
        return DropdownMenuItem<String>(
          value: data['key'],
          child: Text(data['title'],style:TextStyle(fontSize:  ScreenUtil().setSp(30)),),
        );
      }).toList(),
    );
  }
}
