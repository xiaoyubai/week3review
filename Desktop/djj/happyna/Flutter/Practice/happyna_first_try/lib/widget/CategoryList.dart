import 'package:flutter/material.dart';
import 'package:happynafirsttry/widget/Category.dart';
import 'package:happynafirsttry/widget/CategoryCard.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  CategoryList({
    Key key,
    this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 30,
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.only(top: 10, left: 10),
          child: new Text(
            "Shop by Category",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        CustomScrollView(
          shrinkWrap: true,
          primary: false,
          slivers: <Widget>[
            SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverGrid.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: categories
                      .map((category) => CategoryCard(
                            cardName: category.name,
                            cardImage: category.imagePath,
                          ))
                      .toList(),
                ))
          ],
        ),
      ],
    );
  }
}
