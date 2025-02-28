// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FavouriteItem {
  final String title;
  final String photo;

  FavouriteItem({required this.title, required this.photo});

  // Convert FavouriteItem to Map
  Map<String, dynamic> toJson() => {
        'title': title,
        'photo': photo,
      };

  // Convert Map to FavouriteItem
  factory FavouriteItem.fromJson(Map<String, dynamic> json) => FavouriteItem(
        title: json['title'],
        photo: json['photo'],
      );
}

class Favourite {
  static final List<FavouriteItem> _favourites = [];

  static Future<void> addToFavourites(String title, String photo) async {
    _favourites.add(FavouriteItem(title: title, photo: photo));
    await _saveFavourites();
  }

  static Future<void> removeFromFavourites(String title) async {
    _favourites.removeWhere((item) => item.title == title);
    await _saveFavourites();
  }

  static List<FavouriteItem> get favourites => _favourites;

  static Future<void> _saveFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData =
        jsonEncode(_favourites.map((e) => e.toJson()).toList());
    await prefs.setString('favourites', encodedData);
  }

  static Future<void> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedData = prefs.getString('favourites');
    if (encodedData != null) {
      final List<dynamic> decodedList = jsonDecode(encodedData);
      _favourites.clear();
      _favourites
          .addAll(decodedList.map((e) => FavouriteItem.fromJson(e)).toList());
    }
  }
}
