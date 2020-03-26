import 'package:flutter/material.dart';
import 'package:happynafirsttry/widget/Category.dart';

class CategoryCard extends StatelessWidget {

  final String cardName;
  final String cardImage;

  CategoryCard({ this.cardName, this.cardImage });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
//        child: Center(
//            child: Text(
//              cardName,
//              style: TextStyle(
//                fontSize: 25,
//                color: Colors.grey[800],
//              ),
//            )
//        ),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(
              cardImage,
            ),
            fit: BoxFit.cover,
          )
        ),
      ),
    );
  }
}
