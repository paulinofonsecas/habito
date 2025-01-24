import 'package:flutter/material.dart';
import 'package:habito_2/presentation/create_habito/provider/provider.dart';
import 'package:habito_2/presentation/create_habito/widgets/create_habito_body.dart';
import 'package:habito_2/presentation/dashboard/provider/dashboard_provider.dart';

/// {@template create_habito_page}
/// A description for CreateHabitoPage
/// {@endtemplate}
class CreateHabitoPage extends StatelessWidget {
  /// {@macro create_habito_page}
  const CreateHabitoPage({super.key});

  /// The static route for CreateHabitoPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const CreateHabitoPage());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateHabitoNotifier(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: const Text('New Habit'),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: () async {
                  await Provider.of<CreateHabitoNotifier>(context,
                          listen: false)
                      .submitForm();

                  if (context.mounted) {
                    Provider.of<DashboardNotifier>(context, listen: false)
                        .listarHabitos();

                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
            elevation: 0,
          ),
          body: CreateHabitoView(),
        );
      }),
    );
  }
}

/// {@template create_habito_view}
/// Displays the Body of CreateHabitoView
/// {@endtemplate}
class CreateHabitoView extends StatelessWidget {
  /// {@macro create_habito_view}
  const CreateHabitoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateHabitoBody();
  }
}
