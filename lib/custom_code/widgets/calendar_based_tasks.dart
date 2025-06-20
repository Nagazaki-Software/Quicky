// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:intl/intl.dart'; // Import necessário para formatação de datas

class CalendarBasedTasks extends StatefulWidget {
  const CalendarBasedTasks({
    super.key,
    this.width,
    this.height,
    required this.tasks,
    required this.onSelectedCalendar,
  });

  final double? width;
  final double? height;
  final List<TasksRecord> tasks;
  final Future Function(DateTime selected) onSelectedCalendar;

  @override
  State<CalendarBasedTasks> createState() => _CalendarBasedTasksState();
}

class _CalendarBasedTasksState extends State<CalendarBasedTasks> {
  DateTime _currentDay = DateTime.now();

  List<TasksRecord> _getTasksForDay(DateTime day) {
    return widget.tasks.where((task) {
      final taskDate = task.data;
      if (taskDate == null) return false;
      return taskDate.year == day.year &&
          taskDate.month == day.month &&
          taskDate.day == day.day;
    }).toList();
  }

  void _changeDay(int direction) {
    setState(() {
      _currentDay = _currentDay.add(Duration(days: direction));
    });
  }

  List<DateTime> _generateNextDays(int numberOfDays) {
    return List.generate(numberOfDays, (index) {
      return _currentDay.add(Duration(days: index));
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> nextDays = _generateNextDays(5);

    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 200,
      padding: EdgeInsets.all(16.0),
      // 🔴 Removido o decoration com fundo e bordas
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Topo com data atual e navegação
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Data no formato "June 15"
              Text(
                DateFormat("MMMM d", 'en_US').format(_currentDay),
                style: FlutterFlowTheme.of(context).bodyText1.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: FlutterFlowTheme.of(context).primaryColor,
                    ),
              ),
              // Botões de navegação
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.chevron_left,
                        color: FlutterFlowTheme.of(context).primaryColor),
                    onPressed: () => _changeDay(-1),
                  ),
                  IconButton(
                    icon: Icon(Icons.chevron_right,
                        color: FlutterFlowTheme.of(context).primaryColor),
                    onPressed: () => _changeDay(1),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: nextDays.map((day) {
                List<TasksRecord> tasksForDay = _getTasksForDay(day);
                bool hasTasks = tasksForDay.isNotEmpty;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: GestureDetector(
                    onTap: () {
                      widget.onSelectedCalendar(day);
                    },
                    child: Column(
                      children: [
                        Text(
                          "${day.day}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF171A1E), // Texto preto
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                          width: 18.0,
                          height: 18.0,
                          decoration: BoxDecoration(
                            color: hasTasks
                                ? FlutterFlowTheme.of(context).primaryColor
                                : Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
