import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:habito_2/presentation/create_habito/create_habito.dart';
import 'package:habito_2/presentation/create_habito/provider/provider.dart';

import 'conclusoes_diarias_widget.dart';
import 'frequencia_widget.dart';

/// {@template create_habito_body}
/// Body of the CreateHabitoPage.
///
/// Add what it does
/// {@endtemplate}

class CreateHabitoBody extends StatefulWidget {
  const CreateHabitoBody({super.key});

  @override
  _CreateHabitoBodyState createState() => _CreateHabitoBodyState();
}

class _CreateHabitoBodyState extends State<CreateHabitoBody> {
  late CreateHabitoNotifier createHabitoNotifier;

  @override
  void dispose() {
    createHabitoNotifier.nameController.dispose();
    createHabitoNotifier.descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    createHabitoNotifier = Provider.of<CreateHabitoNotifier>(context);

    return Form(
      key: createHabitoNotifier.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: createHabitoNotifier.nameController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                hintText: 'Ler 10 paginas',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'O nome do hábito não pode ser vazio.';
                }
                return null;
              },
            ),
            Gutter(),
            TextFormField(
              controller: createHabitoNotifier.descricaoController,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                hintText: 'Ler 10 ou mais paginas ante de dormir',
              ),
              maxLines: 1,
            ),
            GutterLarge(),
            Row(
              children: [
                Expanded(child: ConclusoesDiariasWidget()),
                Expanded(child: FrequenciaWidget()),
              ],
            ),
            GutterLarge(),
            Text('Icon', style: Theme.of(context).textTheme.bodyMedium!),
            Gutter(),
            iconsWidget(context),
            Gutter(),
            Text('Color', style: Theme.of(context).textTheme.bodyMedium!),
            Gutter(),
            colorsWidget(context),
          ],
        ),
      ),
    );
  }

  Wrap colorsWidget(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: createHabitoNotifier.colors.asMap().entries.map((entry) {
        final int index = entry.key;
        final Color color = entry.value;
        return GestureDetector(
          onTap: () {
            setState(() {
              createHabitoNotifier.selectedColorIndex = index;
            });
          },
          child: Container(
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: createHabitoNotifier.selectedColorIndex == index
                    ? Theme.of(context).colorScheme.onPrimary
                    : Colors.transparent, // Outline on selected color
                width: 2.0,
              ),
            ),
            child: createHabitoNotifier.selectedColorIndex == index
                ? Icon(Icons.check,
                    size: 16.0,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary) // Checkmark icon if selected,
                : null,
          ),
        );
      }).toList(),
    );
  }

  Wrap iconsWidget(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        ...createHabitoNotifier.icons.asMap().entries.map((entry) {
          final int index = entry.key;
          final IconData icon = entry.value;
          return IconButton(
            icon: Icon(
              icon,
              color: createHabitoNotifier.selectedIconIndex == index
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              setState(() {
                createHabitoNotifier.selectedIconIndex = index;
              });
            },
            style: IconButton.styleFrom(
                backgroundColor: createHabitoNotifier.selectedIconIndex == index
                    ? Theme.of(context).primaryColor
                    : null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(8)),
          );
        }),
        TextButton(
          onPressed: () {
            // TODO: Implement show more icons action
            print('More Icons button pressed');
          },
          child: const Text('More Icons >'),
        ),
      ],
    );
  }

  Widget dailyRecurrence(BuildContext context) {
    return ConclusoesDiariasWidget();
  }
}
