import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habito_2/app/app_view.dart';
import 'package:habito_2/app/dependencies/getit_service_locator.dart';
import 'package:habito_2/app/providers/app_provider.dart';
import 'package:habito_2/presentation/create_habito/provider/provider.dart';
import 'package:habito_2/presentation/dashboard/provider/dashboard_provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await setupServiceLocator();

  Intl.defaultLocale = 'pt_BR';
  await initializeDateFormatting('pt_BR', null);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => AppNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => DashboardNotifier(),
      ),
    ],
    child: const MyApp(),
  ));
}
