import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/data_tab.dart';
import 'package:news_app/screens/news_tab.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:news_app/screens/category_tab.dart';

import '../screens/search_tab.dart';
import '../widget/drawer_item.dart';

class HomeScreens extends StatefulWidget {
  HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: DrawerItem(
            onClick: onDrawerClicked,
          ),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(28),
                  bottomLeft: Radius.circular(28),
                )),
            centerTitle: true,
            title: Text(
              categoryModel == null ? "News App" : categoryModel!.title,
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            backgroundColor: Colors.green,
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                    onPressed: () {
                      showSearch(context: context, delegate: SearchArticle());
                    },
                    icon: Icon(
                      Icons.search,
                      size: 35,
                    )),
              )
            ],
          ),
          body: categoryModel == null
              ? CategoryTab(
                  onClicked: onCategoryClicked,
                )
              : DataTab(
                  categoryId: categoryModel!.id,
                )),
    );
  }

  CategoryModel? categoryModel;

  onCategoryClicked(catModel) {
    categoryModel = catModel;
    setState(() {});
  }

  onDrawerClicked(val) {
    if (val == DrawerItem.CATEGORY_ID) {
      categoryModel = null;
      Navigator.pop(context);
      setState(() {});
    } else if (val == DrawerItem.SETTINGS_ID) {}
  }
}
