// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:habito_2/presentation/create_habito/create_habito.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CreateHabitoBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        Provider(
          create: (context) => ChangeNotifierProvider(create: (_) => CreateHabitoNotifier()),
          child: MaterialApp(home: CreateHabitoBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
