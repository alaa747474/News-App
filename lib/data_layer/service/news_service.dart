import 'package:dio/dio.dart';
import 'package:news_app/constants/strings.dart';
import 'package:news_app/data_layer/model/news_model.dart';

class NewsService {
  late Dio dio;
  NewsService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: 20 * 1000,
      connectTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }
  Future<List<Articles>?> getAllNews(String category) async {
    Response response = await dio.get('top-headlines', queryParameters: {
      'country':'eg',
      'category': category,
      'apiKey': '0cfc5c6656e24b3ebc608d507561346a'
    });
    var data = response.data;
    Article article = Article.fromJson(data);
    return article.articles;
  }
}
