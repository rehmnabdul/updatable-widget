library updatable_widget;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

printLog(String message) {
  if (kDebugMode) {
    print("UPDATABLE WIDGET: $message");
  }
}

class UpdatableWidget<T> extends StatefulWidget {
  UpdatableWidget(
      {Key? key, required this.controller, required this.createWidget, this.tag})
      : super(key: key);

  String? tag;
  Widget Function(BuildContext, dynamic) createWidget;
  UpdatableWidgetController<T> controller;

  @override
  State<UpdatableWidget> createState() => _UpdatableWidgetState<T>();
}

class _UpdatableWidgetState<T> extends State<UpdatableWidget> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.createWidget(context, widget.controller.data);
  }
}

class UpdatableWidgetController<T> extends ChangeNotifier {
  UpdatableWidgetController({this.data});

  T? data;
  bool _isDisposed = false;

  bool get isDisposed => _isDisposed;

  void setValue(T data) {
    if (_isDisposed) {
      printLog("The widget is disposed. Data can't be updated");
      return;
    }
    this.data = data;
    notifyListeners();
  }

  @override
  dispose() {
    if (!_isDisposed) {
      super.dispose();
      _isDisposed = true;
    }
  }
}