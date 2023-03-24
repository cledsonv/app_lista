import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (value) {
        if (value == 1) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed('/config');
        }
      },
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 28, right: 16, left: 16, bottom: 16),
          child: Text(
            'Opções',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.sync),
          label: Row(
            children: [
              const Text('Sicronizar'),
              const SizedBox(width: 24),
              Text(
                '12/04/2023 ás 13:00h',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Configurações'),
        ),
      ],
    );
  }
}
