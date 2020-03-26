import 'package:flutter/material.dart';
import 'package:happynafirsttry/config/Constants.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:happynafirsttry/widget/Category.dart';
import 'package:happynafirsttry/widget/CategoryList.dart';
import 'package:happynafirsttry/widget/SliderWidget.dart';

Dio dio = new Dio();

class IndexList extends StatefulWidget {
  final String mt;
  IndexList({Key key, @required this.mt}) : super(key: key);

  @override
  _IndexListState createState() => _IndexListState();
}

class _IndexListState extends State<IndexList> {

  List<Widget> list = new List<Widget>();
  Map<String, dynamic> indexData;

  @override
  void initState() {
    super.initState();
    loadDataInWidget();
  }

  Future<void> loadDataInWidget() async {
    var dataId = AppDataIds.GlobalHomeId;
    var response = await dio.get('https://mstone-api.jd.com/ept/page?id=$dataId');
    if (!mounted) return;
    setState(() {
      var jsonRes = json.decode(response.data);
      indexData = jsonRes['data'];
    });
    int size = indexData['floors'].length;
    var floors = indexData['floors'];
    for (int i = 0; i < size; i++) {
      var item = floors[i];
      Widget wg;
      if (item['floorType'] == 1 && item['styleType'] == 3) {
        wg = SliderWidget(itemData: item);
        list.add(wg);
      }
    }
    Category dogCategory = Category("Dog", "dogCategory.jpeg");
    Category catCategory = Category("Cat", "catCategory.jpeg");
    Category dogCategory2 = Category("Dog", "dogCategory.jpeg");
    Category catCategory2 = Category("Cat", "catCategory.jpeg");

    List<Category> categories = [dogCategory, catCategory, dogCategory2, catCategory2];
    CategoryList categoryList = CategoryList(categories: categories);
    list.add(categoryList);
  }

  Future<void> getIndexData() async {

  }

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;


    return Container(
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxHeight: height - 200,
            ),
            child:  new ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (BuildContext ctx, int i) {
                return list.elementAt(i);
              },
            ),
          ),
        ],
      ),
    );
  }
}
