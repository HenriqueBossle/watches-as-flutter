import 'package:flutter/material.dart';

import '../models/watch.dart';

class WatchDetail extends StatelessWidget {
  final Watch watch;
  const WatchDetail({super.key, required this.watch});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(watch.brand)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 36),
          children: [
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      clipBehavior: Clip.antiAlias,
                      child: AspectRatio(
                        aspectRatio: 1.2,
                        child: Container(
                          color: const Color(0xFFF1F0EA),
                          padding: const EdgeInsets.all(20),
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
                    ),
                    const SizedBox(height: 28),
                    Text(
                      watch.brand.toUpperCase(),
                      style: TextStyle(
                        color: theme.colorScheme.secondary,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(watch.model, style: theme.textTheme.headlineMedium),
                    const SizedBox(height: 12),
                    Text(
                      'R\$ ${watch.price.toStringAsFixed(2).replaceAll('.', ',')}',
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 28),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DETALHES',
                              style: TextStyle(
                                color: theme.colorScheme.secondary,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.4,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _DetailRow(
                              label: 'Marca',
                              value: watch.brand,
                              icon: Icons.verified_outlined,
                            ),
                            const Divider(height: 24),
                            _DetailRow(
                              label: 'Modelo',
                              value: watch.model,
                              icon: Icons.watch_outlined,
                            ),
                            const Divider(height: 24),
                            _DetailRow(
                              label: 'Preço',
                              value:
                                  'R\$ ${watch.price.toStringAsFixed(2).replaceAll('.', ',')}',
                              icon: Icons.sell_outlined,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(icon, size: 20, color: theme.colorScheme.secondary),
        const SizedBox(width: 12),
        Expanded(child: Text(label, style: theme.textTheme.bodyMedium)),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}

Widget _imagePlaceholder() {
  return const Center(
    child: Icon(Icons.watch_outlined, size: 48, color: Color(0xFFB6B5AE)),
  );
}
