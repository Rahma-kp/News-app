

import 'package:newsapp/model/news_headline_model.dart';
import 'package:newsapp/repository/news_repository.dart';

class NewsViewModel{
final _rep=NewsRepository();
Future <NewsHeadlineModel> fectchNewChannelHeadLinesApi()async{
  final response = await _rep.fectchNewChannelHeadLinesApi(); 
  return response;
}
}