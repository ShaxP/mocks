import 'package:flutter/material.dart';

class ViewController extends ChangeNotifier {
  final List<Widget> _stack = <Widget>[];

  bool get isEmpty => _stack.isEmpty;

  bool get isNotEmpty => _stack.isNotEmpty;

  List<Widget> get views => _stack;

  Widget? get currentView => _stack.isEmpty ? null : _stack.last;

  set currentView(Widget? value) {
    if (value == null) {
      if (_stack.isEmpty) {
        return;
      }
      _stack.removeLast();
    } else {
      _stack.add(value);
    }
    notifyListeners();
  }
}
