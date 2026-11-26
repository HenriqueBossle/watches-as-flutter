import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/watch.dart';

class Api {
  static Future<List<Watch>> gettingWatches() async {
    final url = Uri.parse('https://ruby-watches-api.onrender.com/watches');
    final response = await http.get(url);
    final map = jsonDecode(response.body);
    final resultados = map['results'] as List;
    return resultados.map((item) => Watch.createNewWatch(item)).toList();
  }
}