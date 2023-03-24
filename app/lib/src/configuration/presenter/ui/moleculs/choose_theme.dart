import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/stores/app_store.dart';

class ChooseTheme extends StatelessWidget {
  const ChooseTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final appStore = context.watch<AppStore>(
      (store) => store.themeMode,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tema',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        RadioListTile<ThemeMode>(
          value: ThemeMode.system,
          groupValue: appStore.themeMode.value,
          onChanged: appStore.changerThemeMode,
          title: const Text('Sistema'),
        ),
        RadioListTile<ThemeMode>(
          value: ThemeMode.light,
          groupValue: appStore.themeMode.value,
          onChanged: appStore.changerThemeMode,
          title: const Text('Claro'),
        ),
        RadioListTile<ThemeMode>(
          value: ThemeMode.dark,
          groupValue: appStore.themeMode.value,
          onChanged: appStore.changerThemeMode,
          title: const Text('Escuro'),
        ),
      ],
    );
  }
}
