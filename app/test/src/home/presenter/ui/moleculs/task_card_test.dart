import 'package:flutter_test/flutter_test.dart';
import 'package:listinha/src/home/presenter/ui/moleculs/task_card.dart';
import 'package:listinha/src/shared/services/realm/models/task_board_model.dart';
import 'package:realm/realm.dart';

void main() {
  final board = TaskBoard(
    Uuid.v4(),
    'Nova lista',
  );

  test('getProgress', () {
    final tasks = [
      Task(Uuid.v4(), '', complete: true),
      Task(Uuid.v4(), '', complete: true),
      Task(Uuid.v4(), ''),
      Task(Uuid.v4(), ''),
    ];

    final progess = TaskCard(board: board).getProgress(tasks);
    expect(progess, 0.5);
  });
}
