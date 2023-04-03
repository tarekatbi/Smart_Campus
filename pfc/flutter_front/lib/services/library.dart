import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/services/networking.dart';

class Textbook {
  final int id;
  final String title;
  final int nbCopies;
  final String coverImage;
  final String? description;
  final List authors;
  final int pageCount;

  const Textbook({
    required this.id,
    required this.authors,
    required this.title,
    required this.nbCopies,
    required this.coverImage,
    this.description,
    required this.pageCount,
  });

  //convert from json to objects
  static Textbook fromJson(Map<String, dynamic> jsonData) {
    return Textbook(
      id: jsonData["id"],
      authors: jsonData['author'],
      title: jsonData['title'],
      nbCopies: jsonData['nb_copies'],
      coverImage: jsonData['cover_image_link'],
      description: jsonData['desc'],
      pageCount: jsonData['page_count'],
    );
  }
}

class ReservedTextbook {
  final Textbook reservedTextbook;
  final DateTime date;

  const ReservedTextbook({required this.reservedTextbook, required this.date});

  static ReservedTextbook fromJson(Map<String, dynamic> jsonData) {
    return ReservedTextbook(
        reservedTextbook: Textbook.fromJson(jsonData['textbooks']),
        date: DateTime.parse(jsonData['created_at']));
  }
}

class LibraryService {
  String? baseUrl = "smar-t-campus.herokuapp.com";

  ///load the reserved textbooks
  Future<List<ReservedTextbook>> loadReservedTextbooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse("https://$baseUrl/api/textbooks/reserved_textbooks");
    final response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'token': prefs.getString('token')!
    });
    if (response.statusCode == 200) {
      final rawData = jsonDecode(response.body);
      final List data = rawData['data'];
      return data.map((json) => ReservedTextbook.fromJson(json)).toList();
    } else {
      throw Exception("Unable to fetch the data ");
    }
  }

  ///Find books similar to the search query
  Future<List<Textbook>> loadTextbooks(String query) async {
    final url = Uri.parse("https://$baseUrl/api/textbooks/all");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List data = jsonData['textbookList'];
      print(data);
      return data.map((json) => Textbook.fromJson(json)).where((txt) {
        final textbookTitle = txt.title.toLowerCase();
        final queryString = query.toLowerCase();

        return textbookTitle.contains(queryString);
      }).toList();
    } else {
      throw Exception("Cannot fetch textbook data");
    }
  }

  Future<List<Textbook>> loadTextbookRecommandation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final net = new Networking(base_url: "http://$baseUrl/api");
    final rawData =
        await net.getData("/recommender/", prefs.getString('token')!);
    final List data = rawData["data"];

    // print(data);
    return data.map((json) => Textbook.fromJson(json)).toList();
  }

  Future<http.Response> rateTextbook(
      int textbookId, double rating, String token) {
    final url = Uri.parse("https://$baseUrl/api/recommender/$textbookId/rate");
    return http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token': token
        },
        body: jsonEncode(<String, String>{"rating": rating.toString()}));
  }

//send
  Future<http.Response> reserveBook(int textbookId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse("https://$baseUrl/api/textbooks/$textbookId/reserve");
    return http.post(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'token': prefs.getString('token')!
    });
  }

  //check if the textbook hasb been reserved or not
  Future<int> isReserved(int textbookId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse(
        "https://$baseUrl/api/textbooks/reserved_textbooks/$textbookId");
    final response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'token': prefs.getString('token')!
    });
    return response.statusCode;
  }

  /// fetch the popular books of the week
  Future<List<Textbook>> similarBooks(String tag) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final url = Uri.parse("https://$baseUrl/api/textbooks/similar/$tag");
    final response = await http.get(url,
        headers: <String, String>{'token': prefs.getString('token')!});
    if (response.statusCode == 200) {
      final rawData = jsonDecode(response.body);
      final List data = rawData['data'];
      return data.map((json) => Textbook.fromJson(json)).toList();
    } else {
      throw Exception("error -similar books request");
    }
  }

  Future<http.Response> isRated(int textbookId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final url =
          Uri.parse("https://$baseUrl/api/recommender/isRated/$textbookId");
      return http.get(url,
          headers: <String, String>{'token': prefs.getString('token')!});
    } catch (e) {
      print(e);
      throw Exception("Error while checking the reservation");
    }
  }
}
