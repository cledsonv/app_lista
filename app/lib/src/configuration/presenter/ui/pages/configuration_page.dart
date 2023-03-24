import 'package:flutter/material.dart';
import 'package:listinha/src/configuration/presenter/ui/moleculs/choose_theme.dart';

class ConfigurationPage extends StatelessWidget {
  const ConfigurationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('LISTINHA'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style: textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            const ChooseTheme(),
            const SizedBox(height: 20),
            Text(
              'Controle de dados',
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Apagar cache e reniciar o app'),
            )
          ],
        ),
      ),
    );
  }
}
