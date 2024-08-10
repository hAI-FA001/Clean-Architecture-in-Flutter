import 'package:project_learn_clean_arch/core/constants/constants.dart';
import 'package:project_learn_clean_arch/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'news_api_service.g.dart'; // specify this cuz retrofit will generate some code

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  // tell retrofit to make a method which uses Dio to make a network call to an endpoint "/top-headlines" with multiple query params as provided
  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles(
      // API params
      {
    @Query('apiKey') String? apiKey,
    @Query('country') String? country,
    @Query('category') String? category,
  });
}
