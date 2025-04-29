import 'package:flutter/material.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/screens/bloc/cubit.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:news_app/widget/news_item.dart';
import 'package:news_app/widget/source_item.dart';

class NewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: HomeCubit.get(context).sources.length,
            child: TabBar(
                onTap: (value) {
                  HomeCubit.get(context).changeSelectedIndex(value);
                },
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs: HomeCubit.get(context)
                    .sources
                    .map(
                      (e) => Tab(
                        child: SourceItem(
                            selected: HomeCubit.get(context).sources.elementAt(
                                    HomeCubit.get(context).selectedIndex) ==
                                e,
                            source: e),
                      ),
                    )
                    .toList())),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(article: HomeCubit.get(context).articles[index]);
            },
            itemCount: HomeCubit.get(context).articles.length,
          ),
        )
      ],
    );
  }
}
