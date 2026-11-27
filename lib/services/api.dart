import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/watch.dart';

class Api {
  static Future<List<Watch>> gettingWatches() async {
    final url = Uri.parse('https://ruby-watches-api.onrender.com/watches');
    final response = await http.get(url);
    final List<dynamic> results = jsonDecode(response.body);

    final List<Watch> watches = results.map((item) {
      return Watch.createNewWatch(item as Map<String, dynamic>);
    }).toList();

    return watches;
  }
}