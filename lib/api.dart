import 'dart:convert';
import 'package:http/http.dart' as http;
import 'watch.dart';

class Api {
  static Future<List<Watch>> buscarWatches() async {
    final url = Uri.parse('https://ruby-watches-api.onrender.com/watches');
    final resposta = await http.get(url);
    final mapa = jsonDecode(resposta.body);
    final resultados = mapa['results'] as List;
    return resultados.map((j) => Watch.fromJson(j)).toList();
  }
}