library updatable_widget;

import 'package:flutter/material.dart';

typedef CreateWidget<T> = Widget Function(BuildContext context, T data);

class UpdatableWidget<T> extends StatefulWidget {
  UpdatableWidget({Key? key, required this.createWidget, this.controller}) : super(key: key);

  CreateWidget<T> createWidget;
  UpdatableWidgetController? controller;

  @override
  State<UpdatableWidget> createState() => _UpdatableWidgetState();
}

class _UpdatableWidgetState extends State<UpdatableWidget> {
  @override
  void initState() {
    widget.controller?.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.createWidget(context, widget.controller?.data);
  }
}

class UpdatableWidgetController<T> extends ChangeNotifier {
  UpdatableWidgetController({this.data});

  T? data;

  void setValue(T data) {
    this.data = data;
    notifyListeners();
  }
}
