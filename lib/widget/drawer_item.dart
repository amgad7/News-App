import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  Function onClick;
   DrawerItem({required this.onClick,super.key});
static int CATEGORY_ID=1;
static int SETTINGS_ID=2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.2,
            color: Colors.green,
            child: Text(
              "News app!",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              onClick(CATEGORY_ID);
            },
            child: Row(
              children: [
                Icon(Icons.category_outlined),
                SizedBox(
                  width: 8,
                ),
                Text("Categories", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,)),

              ],
            ),
          ),
          SizedBox(height: 8,),
          InkWell(
            onTap: () {
              onClick(SETTINGS_ID);
            },
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(
                  width: 8,
                ),
                Text("Settings", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,)),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
