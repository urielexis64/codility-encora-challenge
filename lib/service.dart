import 'package:codility_encora/models/review.dart';
import 'package:dio/dio.dart';

class NYTimesService {
  final dio = Dio();
  final apiKey = 'A4DP9tCEu8k8E0LkwZQTL1y9NDGicXuJ';
  final baseUrl = 'https://api.nytimes.com/svc/movies/v2';
  final endpoint = 'reviews/picks.json';

  Future<List<Review>?> getMovies() async {
    try {
      final response = await dio.get('$baseUrl/$endpoint?api-key=$apiKey');
      if (response.statusCode == 200) {
        final results = response.data['results'] as List<dynamic>;
        final reviews =
            results.map((result) => Review.fromJson(result)).toList();

        return reviews;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
