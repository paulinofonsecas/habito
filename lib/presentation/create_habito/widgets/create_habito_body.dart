import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:habito_2/domain/entities/habito/habito.dart';
import 'package:habito_2/presentation/create_habito/create_habito.dart';
import 'package:habito_2/presentation/create_habito/provider/provider.dart';
import 'package:habito_2/presentation/create_habito/widgets/affirmation_dropdown.dart';

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
    createHabitoNotifier.goalController.dispose();
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
            Text('Habit name', style: Theme.of(context).textTheme.bodyMedium!),
            TextFormField(
              controller: createHabitoNotifier.nameController,
              decoration: const InputDecoration(
                hintText: 'Eat clean',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a habit name';
                }
                return null;
              },
            ),
            GutterLarge(),
            AffirmationDropdown(
              affirmation: createHabitoNotifier.selectedAffirmation,
              onChanged: (newAffirmation) {
                setState(() {
                  createHabitoNotifier.selectedAffirmation = newAffirmation;
                });
              },
            ),
            Gutter(),
            TextFormField(
              controller: createHabitoNotifier.goalController,
              decoration: const InputDecoration(
                hintText: 'loose 6kg by december',
              ),
              maxLines: 1,
            ),
            GutterLarge(),
            Text('Regularity', style: Theme.of(context).textTheme.bodyMedium!),
            Gutter(),
            regularityWidget(context),
            Gutter(),
            dailyRecurrence(context),
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
                  : Theme.of(context).primaryColor,
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

  Row dailyRecurrence(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Daily recurrence',
                style: Theme.of(context).textTheme.bodyMedium!),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${createHabitoNotifier.dailyRecurrence2} / day'),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (createHabitoNotifier.dailyRecurrence2 > 1) {
                        createHabitoNotifier.dailyRecurrence2--;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(24, 24), // Reduced button size
                  ),
                  child: const Icon(Icons.remove, size: 16),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      createHabitoNotifier.dailyRecurrence2++;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(24, 24), // Reduced button size
                  ),
                  child: const Icon(Icons.add, size: 16),
                ),
              ],
            ),
          ],
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Reminder', style: Theme.of(context).textTheme.bodyMedium!),
          const SizedBox(height: 4),
          TextButton(
            onPressed: () {
              // TODO: Implement reminder action
              print('Reminder button pressed');
            },
            child: const Row(
              children: [
                Text('none'),
                Icon(Icons.close, size: 16),
              ],
            ),
          ),
        ]),
      ],
    );
  }

  SingleChildScrollView regularityWidget(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: createHabitoNotifier.daysOfWeek.map((day) {
          return TextButton(
              onPressed: () {
                setState(() {
                  if (createHabitoNotifier.selectedDays.contains(day)) {
                    createHabitoNotifier.selectedDays.remove(day);
                  } else {
                    createHabitoNotifier.selectedDays.add(day);
                  }
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: createHabitoNotifier.selectedDays.contains(day)
                    ? Theme.of(context).primaryColor
                    : null, // Highlight when selected, else default color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8)), // Rounded borders for the days buttons
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 4,
                ),
                child: Text(
                  day,
                  style: TextStyle(
                    color: createHabitoNotifier.selectedDays.contains(day)
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                  ),
                ),
              ));
        }).toList(),
      ),
    );
  }
}
