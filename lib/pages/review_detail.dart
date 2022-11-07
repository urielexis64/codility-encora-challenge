import 'package:codility_encora/extensions/date_extend.dart';
import 'package:codility_encora/models/review.dart';
import 'package:codility_encora/pages/webview_review.dart';
import 'package:flutter/material.dart';

class ReviewDetail extends StatelessWidget {
  const ReviewDetail({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    final releaseDate = review.openingDate?.formattedDate ?? 'TBA';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        centerTitle: false,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: review.displayTitle,
            child: Image.network(
              review.multimedia.src,
              fit: BoxFit.cover,
            ),
          ),
          Card(
            elevation: 0,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.displayTitle,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  Text(review.headline),
                  const Divider(),
                  Text('by ${review.byline}'),
                  const Divider(),
                  Text(review.summaryShort),
                  const Divider(),
                  Text('Release date: $releaseDate'),
                  const Divider(),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            WebViewReview(url: review.link.url),
                      ),
                    ),
                    child: Text(
                      'Read the New York Times Review of ${review.displayTitle} >>',
                      style: const TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
