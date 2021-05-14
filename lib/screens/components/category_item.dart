import 'package:flutter/material.dart';

import '../../constants.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String imgUrl;

  CategoryItem({@required this.title, @required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      child: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  imgUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 0,
                child: Container(
                  width: 200,
                  padding: EdgeInsets.all(kDefaultPadding),
                  color: Colors.black38,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
