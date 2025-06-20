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

class SwipeSwitch extends StatefulWidget {
  final Color activeColor;
  final Color inactiveColor;
  final Future Function(bool onOrNot) onSwitch;
  final double width;
  final double height;
  final bool isTasker; // Parâmetro para saber se é Tasker ou Task

  const SwipeSwitch({
    Key? key,
    required this.activeColor,
    required this.inactiveColor,
    required this.onSwitch,
    this.width = 60.0,
    this.height = 30.0,
    required this.isTasker, // Passando se é Tasker ou Task
  }) : super(key: key);

  @override
  _SwipeSwitchState createState() => _SwipeSwitchState();
}

class _SwipeSwitchState extends State<SwipeSwitch> {
  bool _isActive = false;
  double _dragPosition = 0;

  @override
  void initState() {
    super.initState();
    _initializeSwitchState();
  }

  // Inicializa o estado com base em isTasker
  void _initializeSwitchState() {
    // Aqui você pode definir o valor inicial com base em `isTasker`
    // Se for Tasker, coloca o switch ativo, caso contrário, inativo
    setState(() {
      _isActive =
          widget.isTasker; // Considerando `true` para Tasker (ativa o switch)
      _dragPosition = _isActive ? widget.width - widget.height : 0;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragPosition += details.delta.dx;
      _dragPosition = _dragPosition.clamp(0.0, widget.width - widget.height);
    });
  }

  void _onPanEnd(DragEndDetails details) async {
    bool newState = _dragPosition > (widget.width - widget.height) / 2;

    // Se o estado mudou, atualiza e chama a função onSwitch
    if (newState != _isActive) {
      setState(() {
        _isActive = newState;
        _dragPosition = newState ? widget.width - widget.height : 0;
      });

      await widget.onSwitch(_isActive);
    } else {
      // Se não mudou, volta à posição inicial
      setState(() {
        _dragPosition = _isActive ? widget.width - widget.height : 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.height / 2),
          color: _isActive ? widget.activeColor : widget.inactiveColor,
        ),
        child: Stack(
          children: [
            Positioned(
              left: _dragPosition,
              top: 0,
              bottom: 0,
              child: Container(
                width: widget.height,
                height: widget.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(widget.height / 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
