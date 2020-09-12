import 'package:flutter/cupertino.dart';
import 'package:mobile_developer_skill_testing/provider/MemberProvider.dart';
import 'package:mobile_developer_skill_testing/widgets/appDropdown.dart';
import 'package:provider/provider.dart';

class SearchOptions extends StatefulWidget {
  @override
  _SearchOptionsState createState() => _SearchOptionsState();
}

class _SearchOptionsState extends State<SearchOptions> {
  String _selectSearch = "0";

  _SearchOptionsState();

  @override
  Widget build(BuildContext context) {
    const listItem = [
      {'key': '0', 'title': 'Day View'},
      {'key': '1', 'title': 'Month View'},
      {'key': '2', 'title': 'Quarter View'},
      {'key': '3', 'title': 'Year View'}
    ];
    return Row(
      children: <Widget>[
        AppDropdown(
          items: listItem,
          value: _selectSearch,
          onChanged: onSelect,
        )
      ],
    );
  }

  onSelect(data) {
    setState(() {
      this._selectSearch = data;
    });
    context.read<MemberProvider>().fetchData(data);
  }
}