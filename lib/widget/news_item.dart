import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsDataModel.dart';

class NewsItem extends StatelessWidget {
  NewsItem({required this.article, super.key});
  Articles article;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: Colors.grey.shade200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage??"",
                height: 250,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  article.source?.name ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Colors.grey),
                ),
                Text(
                  article.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black),
                ),
                Text(
                  article.description ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black54),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
