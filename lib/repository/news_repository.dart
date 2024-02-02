import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/constant/constants.dart';
import 'package:newsapp/model/news_headline_model.dart';

class NewsRepository {
  Future<NewsHeadlineModel> fectchNewChannelHeadLinesApi() async {
    String url = constants.topHeadLine;
    final response = await http.get(Uri.parse(url));
    if(kDebugMode){
    print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsHeadlineModel.fromJson(body);
    }
    throw Exception("error");
  }
}
