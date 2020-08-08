import 'dart:convert';

import 'package:flutterando_clean_dart/app/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  final String thumbnail;
  final String title;
  final String youtuber;

  ResultSearchModel({this.thumbnail, this.title, this.youtuber});

  Map<String, dynamic> toMap() {
    return {
      'thumbnail': thumbnail,
      'title': title,
      'youtuber': youtuber,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ResultSearchModel(
      thumbnail: map['thumbnail'],
      title: map['title'],
      youtuber: map['youtuber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) =>
      ResultSearchModel.fromMap(json.decode(source));
}
