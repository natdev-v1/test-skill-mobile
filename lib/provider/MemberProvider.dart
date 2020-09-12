import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobile_developer_skill_testing/util/Http.dart';

class MemberProvider with ChangeNotifier {
  List<dynamic> list = [];

  List<dynamic> summarytier = [];
  Map<String, dynamic> summary = {};
  int total= 0;
  MemberProvider(){
    fetchData("0");
  }
  fetch(endPoint) async {
    Response res = await HttpUtil.http().get(endPoint);
    this.list = res.data['data']['list'];
    this.summarytier = res.data['data']['summarytier'];
    this.summary = res.data['data']['summary'];
    this.total = res.data['data']['total'];
    notifyListeners();
  }

  fetchData(String data) {
    switch (data) {
      case '0':
        this.fetch('bi-member-day-2020-04-01.json');
        break;
      case '1':
        this.fetch('bi-member-month-2020-03.json');
        break;
      case '2':
        this.fetch('bi-member-quarter-2019-06.json');
        break;
      case '3':
        this.fetch('bi-member-year-2019-04-01.json');
        break;
      default:
        this.fetch('bi-member-day-2020-04-01.json');
        break;
    }
  }
}
