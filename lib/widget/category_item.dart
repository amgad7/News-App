import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel model;
  CategoryItem({required this.index,required this.model, super.key});
int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight:  Radius.circular(25),
            bottomRight:index.isOdd? Radius.circular(25):Radius.zero,
            bottomLeft:index.isEven?Radius.circular(25): Radius.zero,
          ),
          color: model.color,
        ),
        child: Column(
          children: [
            Expanded(child: Image.asset(model.image)),
            Text(
              model.title,
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
