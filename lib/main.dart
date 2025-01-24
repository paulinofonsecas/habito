import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habito_2/app/dependencies/getit_service_locator.dart';
import 'package:habito_2/presentation/dashboard/provider/provider.dart';
import 'package:habito_2/presentation/dashboard/view/dashboard_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await setupServiceLocator();

  Intl.defaultLocale = 'pt_BR';
  await initializeDateFormatting('pt_BR', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DashboardNotifier(),
        ),
      ],
      child: MaterialApp(
        title: 'Criar Hábito',
        theme: ThemeData(
          fontFamily: 'Roboto',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        ),
        home: const DashboardPage(),
      ),
    );
  }
}
