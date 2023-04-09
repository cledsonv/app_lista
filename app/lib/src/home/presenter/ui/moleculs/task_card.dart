import 'package:flutter/material.dart';
import 'package:listinha/src/shared/services/realm/models/task_board_model.dart';

enum TaskCardStatus {
  pending(text: 'Pendente', icon: Icons.access_alarm),
  complete(text: 'Completo', icon: Icons.check),
  disable(text: 'Desativativado', icon: Icons.cancel_outlined);

  final String text;
  final IconData icon;

  const TaskCardStatus({required this.text, required this.icon});
}

class TaskCard extends StatelessWidget {
  final TaskBoard board;

  const TaskCard({super.key, required this.board});

  double getProgress(List<Task> tasks) {
    if (tasks.isEmpty) return 0;
    final completes = tasks.where((e) => e.complete).length;
    return completes / tasks.length;
  }

  String getProgressText(List<Task> tasks) {
    final completes = tasks.where((e) => e.complete).length;
    return '$completes / ${tasks.length}';
  }

  TaskCardStatus getTaskStatus(TaskBoard board, double progress) {
    if (!board.enable) {
      return TaskCardStatus.disable;
    } else if (progress < 1.0) {
      return TaskCardStatus.pending;
    } else {
      return TaskCardStatus.complete;
    }
  }

  Color getBackGroundColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.primaryContainer;
      case TaskCardStatus.complete:
        return theme.colorScheme.tertiaryContainer;
      case TaskCardStatus.disable:
        return theme.colorScheme.errorContainer;
    }
  }

  Color getColor(TaskCardStatus status, ThemeData theme) {
    switch (status) {
      case TaskCardStatus.pending:
        return theme.colorScheme.primary;
      case TaskCardStatus.complete:
        return theme.colorScheme.tertiary;
      case TaskCardStatus.disable:
        return theme.colorScheme.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final progress = getProgress(board.task);
    final progressText = getProgressText(board.task);
    final title = board.title;
    final status = getTaskStatus(board, progress);
    final statusText = status.text;
    final iconData = status.icon;

    final color = getColor(status, theme);
    final backgroundColor = getBackGroundColor(status, theme);

    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                iconData,
                color: theme.iconTheme.color?.withOpacity(0.5),
              ),
              const Spacer(),
              Text(
                statusText,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          if (board.task.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                LinearProgressIndicator(
                  color: color,
                  backgroundColor: theme.colorScheme.onPrimary,
                  value: progress,
                ),
                const SizedBox(height: 2),
                Text(
                  progressText,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodySmall?.color?.withOpacity(0.5),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
