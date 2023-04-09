import 'package:flutter/material.dart';
import 'package:listinha/src/home/presenter/ui/moleculs/custom_drawer.dart';
import 'package:listinha/src/home/presenter/ui/moleculs/task_card.dart';
import 'package:listinha/src/shared/services/realm/models/task_board_model.dart';
import 'package:listinha/src/shared/widgets/user_image_button.dart';
import 'package:realm/realm.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LISTINHA'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: UserImageButton(),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.edit),
        label: const Text('Nova Lista'),
        onPressed: () {
          Navigator.of(context).pushNamed('./edit');
        },
      ),
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
              child: ListView.separated(
                itemBuilder: (_, index) {
                  final board = TaskBoard(
                    Uuid.v4(),
                    'Nova lista',
                    task: [
                      Task(Uuid.v4(), '', complete: true),
                      Task(Uuid.v4(), '', complete: true),
                      Task(Uuid.v4(), '', complete: true),
                      Task(Uuid.v4(), '', complete: true),
                    ],
                  );
                  return TaskCard(
                    board: board,
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemCount: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: SegmentedButton<int>(
                segments: const [
                  ButtonSegment(
                    value: 0,
                    label: Text('Todos'),
                  ),
                  ButtonSegment(
                    value: 1,
                    label: Text('Pendentes'),
                  ),
                  ButtonSegment(
                    value: 2,
                    label: Text('Concluídas'),
                  ),
                  ButtonSegment(
                    value: 3,
                    label: Text('Desativadas'),
                  ),
                ],
                onSelectionChanged: (value) {},
                selected: const {3},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
