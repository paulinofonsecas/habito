import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:habito_2/presentation/create_habito/provider/select_icon_list_provider.dart';
import 'package:habito_2/presentation/dashboard/provider/provider.dart';

class SelectIconListBottomSheet extends StatelessWidget {
  const SelectIconListBottomSheet({super.key});

  static Future show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (c) => ChangeNotifierProvider.value(
        value: Provider.of<SelectIconListProvider>(context, listen: false),
        child: const SelectIconListBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectIconListProvider = Provider.of<SelectIconListProvider>(context);

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selecione um icone',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              for (var listIcons in selectIconListProvider.icons.keys)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gutter(),
                    Text(
                      listIcons.toUpperCase(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Wrap(
                      spacing: 8.0,
                      children: [
                        for (var icon
                            in selectIconListProvider.icons[listIcons]!)
                          IconButton(
                            icon: Icon(icon),
                            onPressed: () {
                              Navigator.pop(context, icon);
                            },
                          ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
