import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widget/category_item.dart';

class CategoryTab extends StatelessWidget {
  Function onClicked;
  CategoryTab({required this.onClicked,super.key});
  var categories = CategoryModel.getCateories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Pick your category of interest",
          style: TextStyle(fontSize: 40),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  onClicked( categories[index]);
                },
                child: CategoryItem(index: index,
                    model: categories[index]),
              );
            },
            itemCount: categories.length,
          ),
        )
      ],
    );
  }

}
