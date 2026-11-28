import 'package:flutter/material.dart';

import '../services/api.dart';
import '../models/watch.dart';
import './watch_detail.dart';

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
      setState(() {
        _watches = list;
        _loading = false;
      });
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
      appBar: AppBar(
        title: const Text('Relogios'),
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(Icons.watch_outlined, size: 23),
        ),
        leadingWidth: 48,
      ),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : _error != null
            ? _StatusMessage(
                icon: Icons.cloud_off_outlined,
                title: 'Não foi possível carregar os relógios',
                message: _error!,
              )
            : _watches.isEmpty
            ? const _StatusMessage(
                icon: Icons.watch_later_outlined,
                title: 'Nenhum relógio por aqui',
                message: 'Quando houver modelos disponíveis, eles aparecerão nesta coleção.',
              )
            : Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 680),
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(20, 28, 20, 40),
                    children: [
                      Text(
                        'CURADORIA DE TEMPO',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Relógios para marcar\nseu momento.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${_watches.length} ${_watches.length == 1 ? 'modelo disponível' : 'modelos disponíveis'} para conhecer',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 26),
                      for (final watch in _watches)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: _WatchCard(
                            watch: watch,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => WatchDetail(watch: watch),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class _WatchCard extends StatelessWidget {
  const _WatchCard({required this.watch, required this.onTap});

  final Watch watch;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 148,
          child: Row(
            children: [
              SizedBox(
                width: 148,
                child: Container(
                  color: const Color(0xFFF1F0EA),
                  padding: const EdgeInsets.all(10),
                  child: Image.network(
                    watch.imageUrl,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, progress) =>
                        progress == null ? child : _imagePlaceholder(),
                    errorBuilder: (context, error, stackTrace) =>
                        _imagePlaceholder(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        watch.brand.toUpperCase(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: theme.colorScheme.secondary,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        watch.model,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 9),
                      Text(
                        'R\$ ${watch.price.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imagePlaceholder() {
    return const Center(
      child: Icon(Icons.watch_outlined, size: 38, color: Color(0xFFB6B5AE)),
    );
  }
}

class _StatusMessage extends StatelessWidget {
  const _StatusMessage({
    required this.icon,
    required this.title,
    required this.message,
  });

  final IconData icon;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 42, color: theme.colorScheme.secondary),
              const SizedBox(height: 18),
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
