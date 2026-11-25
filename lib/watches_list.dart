import 'package:flutter/material.dart';
import 'api.dart';
import 'watch.dart';

class WatchesList extends StatefulWidget {
  const WatchesList({super.key});

  @override
  State<WatchesList> createState() => _WatchesListState();
}

class _WatchesListState extends State<WatchesList> {
  bool _loading = true;
  String? _erro;
  List<Watch> _watches = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final lista = await Api.buscarWatches();
      setState(() { _watches = lista; _loading = false; });
    } catch (e) {
      setState(() { _erro = 'Erro ao carregar'; _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Relogios')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _erro != null
              ? Center(child: Text(_erro!))
              : ListView.builder(
                  itemCount: _watches.length,
                  itemBuilder: (context, i) {
                    final w = _watches[i];
                    return ListTile(
                      leading: CircleAvatar(backgroundImage: NetworkImage(w.imageUrl)),
                      title: Text(w.brand),
                      subtitle: Text('${w.model} · ${w.price}'),
                    );
                  },
                ),
    );
  }
}