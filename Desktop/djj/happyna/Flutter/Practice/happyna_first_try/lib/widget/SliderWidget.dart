import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SliderWidget extends StatefulWidget {

  final Map itemData;
  SliderWidget({Key key, @required this.itemData}) :super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    var banner = widget.itemData['banner'];
    final int length = banner.length;
    String bgImg = widget.itemData['bgImg'];
    return Stack(
      alignment: new Alignment(0, 1),
      children: <Widget>[
        Container(
          child: new Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                banner[index]["bannerImage"],
                fit: BoxFit.fill,
              );
            },
            itemCount: length,
            autoplay: true,
            pagination: new SwiperPagination(
              margin: EdgeInsets.all(100),
            ),
          ),
          height: 400,
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: new Image(
            image: NetworkImage(bgImg),
          ),
        ),
      ],
    );
  }
}
