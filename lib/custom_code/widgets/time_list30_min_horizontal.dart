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

class TimeList30MinHorizontal extends StatefulWidget {
  final double? width;
  final double? height;
  final Future Function(DateTime selectedTime)? onTimeSelected;
  final List<TasksRecord> tasks; // ✅ Correto agora

  const TimeList30MinHorizontal({
    Key? key,
    required this.width,
    required this.height,
    this.onTimeSelected,
    required this.tasks,
  }) : super(key: key);

  @override
  _TimeList30MinState createState() => _TimeList30MinState();
}

class _TimeList30MinState extends State<TimeList30MinHorizontal> {
  late List<TimeOfDay> times;
  late ScrollController _scrollController;
  late int selectedIndex;
  final double itemWidth = 80;
  final double itemSpacing = 16;

  @override
  void initState() {
    super.initState();
    times = _generateTimes();
    _scrollController = ScrollController();
    selectedIndex = _getClosestTimeIndex();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToInitialIndex();
      _updateHorarioAppState(selectedIndex);
    });

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  List<TimeOfDay> _generateTimes() {
    return List.generate(48, (index) {
      int hour = index ~/ 2;
      int minute = (index % 2) * 30;
      return TimeOfDay(hour: hour, minute: minute);
    });
  }

  int _getClosestTimeIndex() {
    final now = DateTime.now();
    final totalMinutes = now.hour * 60 + now.minute;
    final roundedMinutes = ((totalMinutes + 29) ~/ 30) * 30;
    final roundedHour = roundedMinutes ~/ 60;
    final roundedMinute = roundedMinutes % 60;
    final roundedTime =
        TimeOfDay(hour: roundedHour % 24, minute: roundedMinute);

    return times.indexWhere(
        (t) => t.hour == roundedTime.hour && t.minute == roundedTime.minute);
  }

  Future<void> _scrollToInitialIndex() async {
    final screenCenter = widget.width! / 2;
    final offset = (itemWidth + itemSpacing) * selectedIndex -
        screenCenter +
        itemWidth / 2;
    _scrollController
        .jumpTo(offset.clamp(0.0, _scrollController.position.maxScrollExtent));
  }

  Future<void> _scrollToIndex(int index) async {
    final screenCenter = widget.width! / 2;
    final offset =
        (itemWidth + itemSpacing) * index - screenCenter + itemWidth / 2;
    await _scrollController.animateTo(
      offset.clamp(0.0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final screenCenter = widget.width! / 2;
    final scrollOffset = _scrollController.offset;
    final centerPosition = scrollOffset + screenCenter;
    final index = (centerPosition / (itemWidth + itemSpacing)).round();

    if (index >= 0 && index < times.length && index != selectedIndex) {
      setState(() {
        selectedIndex = index;
      });

      _updateHorarioAppState(index);
    }
  }

  void _updateHorarioAppState(int index) {
    final now = DateTime.now();
    final selected = times[index];
    final selectedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      selected.hour,
      selected.minute,
    );

    FFAppState().horarioCurrentTasks = selectedDateTime;

    if (widget.onTimeSelected != null) {
      widget.onTimeSelected!(selectedDateTime);
    }
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'A.M' : 'P.M';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.transparent, // SEM FUNDO PRETO NENHUM AQUI
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: times.length,
        physics: BouncingScrollPhysics(), // toque suave
        itemBuilder: (context, index) {
          final time = times[index];
          final formatted = _formatTime(time);
          final parts = formatted.split(':');
          final hour = parts[0];
          final minuteAndPeriod = parts[1].split(' ');
          final minute = minuteAndPeriod[0];
          final period = minuteAndPeriod[1];
          final isSelected = index == selectedIndex;

          final hasTask = widget.tasks.any((task) {
            final taskTime = task.tempo;
            if (taskTime == null) return false;
            return taskTime.hour == time.hour && taskTime.minute == time.minute;
          });

          return GestureDetector(
            onTap: () async {
              setState(() {
                selectedIndex = index;
              });
              await _scrollToIndex(index);
              _updateHorarioAppState(index);
            },
            child: Container(
              width: itemWidth,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.center,
              color: Colors.transparent, // SEM FUNDO PRETO AQUI TAMBÉM
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$hour:$minute ',
                          style: TextStyle(
                            color: const Color(0xFF242424)
                                .withOpacity(isSelected ? 1.0 : 0.3),
                            fontSize: isSelected ? 22 : 16,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: period,
                          style: TextStyle(
                            color: const Color(0xFF242424)
                                .withOpacity(isSelected ? 1.0 : 0.3),
                            fontSize: isSelected ? 16 : 12,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      color: hasTask
                          ? FlutterFlowTheme.of(context).primaryColor
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
