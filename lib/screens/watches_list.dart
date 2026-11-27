import 'package:flutter/material.dart';
import '../services/api.dart';
import '../models/watch.dart';

class WatchesList extends StatefulWidget {
  const WatchesList({super.key});

  @override
  State<WatchesList> createState() => _WatchesListState();
}

class _WatchesListState extends State<WatchesList> {
  bool _loading = true;
  String? _error;
  List<Watch> _watches = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final List<Watch> list = await Api.gettingWatches();
      setState(() { _watches = list; _loading = false; });
    } catch (e) {
       print('ERRO: $e');

      setState(() {
        _error = 'Erro ao carregar: $e';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Relogios')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!))
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