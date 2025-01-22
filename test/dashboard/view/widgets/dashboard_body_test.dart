// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:habito_2/presentation/dashboard/dashboard.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DashboardBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => DashboardNotifier()),
          child: MaterialApp(home: DashboardBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
