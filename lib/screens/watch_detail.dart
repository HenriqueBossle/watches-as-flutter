import 'package:flutter/material.dart';
import '../models/watch.dart';

class WatchDetail extends StatelessWidget {
  final Watch watch;
  const WatchDetail({super.key, required this.watch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(watch.brand)),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Center(
            child: CircleAvatar(
              radius: 56,
              backgroundImage: NetworkImage(watch.imageUrl),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              watch.brand,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Divider(height: 32),
          Text(watch.brand),
          Text(watch.model),
          Text(watch.price.toString()),
        ],
      ),
    );
  }
}