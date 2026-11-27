import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:watches/main.dart';

void main() {
  testWidgets('App opens the watches list', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Relogios'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
