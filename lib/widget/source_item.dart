import 'package:flutter/material.dart';
import 'package:news_app/models/SourcesResponse.dart';

class SourceItem extends StatelessWidget {
  SourceItem({required this.selected, required this.source, super.key});
  Sources source;
  bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green),
          color: selected ? Colors.green : Colors.transparent),
      child: Text(
        source.name ?? "",
        style: TextStyle(color: selected ? Colors.white : Colors.green),
      ),
    );
  }
}
