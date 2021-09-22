import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_app_/model/news_models.dart';

class ApiManager {
  //get api data
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel = null;

    // use try because not every reult can be get
    try {
      var response = await client
          .get('http://newsapi.org/v2/everything?domains=wsj.com&apiKey=USEYOURAPIKEYHERE');

      // check if data was success
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}
