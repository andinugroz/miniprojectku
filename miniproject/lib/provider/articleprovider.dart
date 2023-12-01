import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miniproject/provider/config.dart';
import 'package:http/http.dart' as http;
import 'package:miniproject/session.dart';
import 'package:http_parser/http_parser.dart';

class ArticleProvider extends ChangeNotifier {
  Future<dynamic> createarticle(String title, String body, String banner,
      String imageUrl, String categories) async {
    try {
      final url =
          Uri.parse('${Config.endPoint}/web-forum-service/article/create');
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                "Bearer ${await Session.get(Session.tokenSessionKey)}"
          },
          body: jsonEncode({
            'title': title,
            'body': body,
            'imageUrl': imageUrl,
            'banner': banner,
            'categories': [
              {"name": categories}
            ],
          }));

      final result = json.decode(response.body);
      print(result);

      if (response.statusCode == 200) {
        return result;
      } else {
        print(result);
      }
    } catch (error) {
      print('Terjadi kesalahan: $error');
      return null; // Mengembalikan null jika terjadi kesalahan
    }
  }

  Future<dynamic> getlistarticle(
      int page, String title, String category) async {
    try {
      final url =
          Uri.parse('${Config.endPoint}/web-forum-service/article/list');
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization':
                "Bearer ${await Session.get(Session.tokenSessionKey)}"
          },
          body: jsonEncode({
            'page': page,
            'title': title,
            'category': category,
          }));

      final result = json.decode(response.body);

      if (response.statusCode == 200) {
        return result;
      } else {
        return result;
      }
    } catch (error) {
      print('Terjadi kesalahan: $error');
      return null; // Mengembalikan null jika terjadi kesalahan
    }
  }

  Future<dynamic> uploadarticleimage(File imagefile) async {
    try {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              '${Config.endPoint}/master-service/upload/image/articles-image'));

      request.headers['Authorization'] =
          "Bearer ${await Session.get(Session.tokenSessionKey)}";

      request.files.add(http.MultipartFile(
          'image', imagefile.readAsBytes().asStream(), imagefile.lengthSync(),
          filename: 'image.jpg', contentType: MediaType('image', 'jpeg')));
      var response = await request.send();
      var responseString = await response.stream.bytesToString();

      final result = json.decode('${responseString}');
      print(result);
      if (response.statusCode == 200) {
        return result;
      } else {}
    } catch (error) {
      print('Terjadi kesalahan: $error');
      return null; // Mengembalikan null jika terjadi kesalahan
    }
  }

  Future<dynamic> getarticledetail(String id) async {
    try {
      final url =
          Uri.parse('${Config.endPoint}/web-forum-service/article?id=$id');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              "Bearer ${await Session.get(Session.tokenSessionKey)}"
        },
      );

      final result = json.decode(response.body);

      if (response.statusCode == 200) {
        return result;
      } else {
        return result;
      }
    } catch (error) {
      print('Terjadi kesalahan: $error');
      return null; // Mengembalikan null jika terjadi kesalahan
    }
  }
}
