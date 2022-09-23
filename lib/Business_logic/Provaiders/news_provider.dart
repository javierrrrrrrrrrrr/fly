import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fly_cliente/Constants/contants.dart';
import 'package:http/http.dart' as http;

import '../../DataLayer/Models/news_model.dart';

class NewsProvider extends ChangeNotifier {
  String token = '';

  List<News> news = [];
  bool respuesta = false;

  Future<bool> getNews() async {
    var request = http.Request('GET', Uri.parse('$kip/news'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String respuesta = await response.stream.bytesToString();
      final List<dynamic> decodedResp = json.decode(respuesta);
      news.clear();
      for (int i = 0; i < decodedResp.length; i++) {
        news.add(News.fromMap(decodedResp[i]));
      }

      return true;
    } else {
      return false;
    }
  }

  Future<List<News>> getNewsList() async {
    news.clear();
    var response = await http.get(Uri.parse('$kip/news'));

    if (response.statusCode == 200) {
      final List<dynamic> decodedResp = json.decode(response.body);
      decodedResp.map((item) => news.add(News.fromMap(item))).toList();
      respuesta = true;
    }

    return news;
  }
}
