import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mobile_developer_skill_testing/provider/MemberProvider.dart';
import 'package:mobile_developer_skill_testing/screens/widgets/searchOptions.dart';
import 'package:mobile_developer_skill_testing/widgets/appCard.dart';
import 'package:mobile_developer_skill_testing/widgets/appDropdown.dart';
import 'package:provider/provider.dart';

class DashBord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    List<dynamic> summarytier =
        context.select((MemberProvider m) => m.summarytier);
    ;
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Flexible(
              child: DataCard(
                totalRev:
                    summarytier.length > 0 ? summarytier[0]['total_amount'] : 0,
                totalMembers: summarytier.length > 0
                    ? summarytier[0]['total_members']
                    : 0,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: DataCard(
                totalRev:
                    summarytier.length > 0 ? summarytier[0]['total_amount'] : 0,
                totalMembers: summarytier.length > 0
                    ? summarytier[0]['total_members']
                    : 0,
              ),
            )
          ],
        ),
        Flexible(
          child: SearchOptions(),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 7,
          child: ListData(),
        ),
        Expanded(
          flex: 1,
          child: Total(),
        )
      ],
    ));
  }
}

class Total extends StatelessWidget {
  List<dynamic> list;

  @override
  Widget build(BuildContext context) {
    list = context.select((MemberProvider m) => m.list);
    final formatter = new NumberFormat("#,###");

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Text("Total LTV :${formatter.format(sumData('totalamount')) }",style: TextStyle(fontSize: ScreenUtil().setSp(25)),),
          ),
          Flexible(
            child: Text("Total Trans :${formatter.format(sumData('totaltransaction'),) }",style: TextStyle(fontSize: ScreenUtil().setSp(25))),
          ),
          Flexible(
            child: Text("Total Point :${formatter.format(sumData('remainingpoint')) }",style: TextStyle(fontSize: ScreenUtil().setSp(25))),
          )
        ],
      ),
    );
  }

  sumData(String key) {
    int sum = 0;
    list.forEach((element) {
      if (element[key] !=null) {
        sum += element[key];
      }
    });
    return sum;
  }
}

class DataCard extends StatelessWidget {
  final int totalMembers;
  final int totalRev;

  DataCard({Key key, this.totalMembers = 0, this.totalRev = 0});

  @override
  Widget build(BuildContext context) {
    final formatter = new NumberFormat.compact();
    return AppCard(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Text('Total Members',style: TextStyle(fontSize: ScreenUtil().setSp(25))),
              ),
              Expanded(
                child: Text(totalMembers.toString(),style: TextStyle(fontSize: ScreenUtil().setSp(25))),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Text('Total Rev.',style: TextStyle(fontSize: ScreenUtil().setSp(25))),
              ),
              Flexible(
                child: Text(formatter.format(totalRev).toString(),style: TextStyle(fontSize: ScreenUtil().setSp(25))),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ListData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<dynamic> list = context.select((MemberProvider m) => m.list);
    final formatter = new NumberFormat("#,###");
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: ScreenUtil().setHeight(350),
          child: AppCard(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Name",style: TextStyle(fontSize: ScreenUtil().setSp(25))),
                    ),
                    Expanded(
                      child: Text(list[index]['customername'],style: TextStyle(fontSize: ScreenUtil().setSp(25))),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("ID",style: TextStyle(fontSize: ScreenUtil().setSp(25))),
                    ),
                    Expanded(
                      child: Text(list[index]['customerphone'],style: TextStyle(fontSize: ScreenUtil().setSp(25))),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Tier",style: TextStyle(fontSize: ScreenUtil().setSp(25))),
                    ),
                    Expanded(
                      child: Text(list[index]['customertier'],style: TextStyle(fontSize: ScreenUtil().setSp(25))),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("LTV",style: TextStyle(fontSize: ScreenUtil().setSp(25)),),
                    ),
                    Expanded(
                      child: Text(formatter
                          .format(list[index]['totalamount'])
                          .toString(),style: TextStyle(fontSize: ScreenUtil().setSp(25))),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Total Trans",style: TextStyle(fontSize: ScreenUtil().setSp(25))),
                    ),
                    Expanded(
                      child: Text(list[index]['totaltransaction'].toString(),style: TextStyle(fontSize: ScreenUtil().setSp(25))),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Total Point",style: TextStyle(fontSize: ScreenUtil().setSp(25))),
                    ),
                    Expanded(
                      child: Text(formatter
                          .format(list[index]['totalreward'])
                          .toString(),style: TextStyle(fontSize: ScreenUtil().setSp(25))),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Remaining Point",style: TextStyle(fontSize: ScreenUtil().setSp(25))),
                    ),
                    Expanded(
                      child: Text(formatter
                          .format(list[index]['remainingpoint'])
                          .toString(),style: TextStyle(fontSize: ScreenUtil().setSp(25))),
                    )
                  ],
                ),
              )
            ],
          )),
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 20,
      ),
    );
  }
}
