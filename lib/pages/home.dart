import 'package:codility_encora/models/review.dart';
import 'package:codility_encora/service.dart';
import 'package:codility_encora/widgets/card.dart';
import 'package:codility_encora/widgets/loading.dart';
import 'package:codility_encora/widgets/review_error.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final NYTimesService service = NYTimesService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Review>?>(
        future: service.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }

          if (snapshot.hasError) {
            return const ReviewError();
          }

          final reviews = snapshot.data!;
          return ListView.separated(
            itemCount: reviews.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              return ReviewCard(review: reviews[index]);
            },
            separatorBuilder: (_, __) => const Divider(height: 0),
          );
        },
      ),
    );
  }
}
