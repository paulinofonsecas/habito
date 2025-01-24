import 'package:flutter/material.dart';
import 'package:habito_2/app/providers/app_provider.dart';
import 'package:habito_2/presentation/create_habito/provider/provider.dart';
import 'package:habito_2/presentation/dashboard/view/dashboard_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appNotifier = Provider.of<AppNotifier>(context);

    return ListenableBuilder(
      listenable: appNotifier,
      builder: (context, child) {
        return MaterialApp(
          title: 'Criar Hábito',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Roboto',
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.lightBlue,
              brightness:
                  appNotifier.isDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          home: const DashboardPage(),
        );
      },
    );
  }
}
