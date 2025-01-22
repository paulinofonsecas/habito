import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habito_2/app/dependencies/getit_service_locator.dart';
import 'package:habito_2/presentation/create_habito/view/create_habito_page.dart';
import 'package:habito_2/presentation/dashboard/view/dashboard_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Criar Hábito',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue, // Adjust as needed
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: const DashboardPage(),
    );
  }
}
