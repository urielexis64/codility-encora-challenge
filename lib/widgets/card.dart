import 'package:codility_encora/extensions/date_extend.dart';
import 'package:codility_encora/models/review.dart';
import 'package:codility_encora/pages/review_detail.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    final releaseDate = review.openingDate?.formattedDate ?? 'TBA';
    return InkWell(
      onTap: () => _goToDetail(context),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            Hero(
              tag: review.displayTitle,
              child: Image.network(
                review.multimedia.src,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      review.displayTitle,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    child: Text(review.headline,
                        maxLines: 3, overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                    'Release date: $releaseDate',
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _goToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReviewDetail(review: review),
      ),
    );
  }
}
