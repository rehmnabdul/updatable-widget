library updatable_widget;

import 'package:flutter/material.dart';

typedef CreateWidget = Widget Function(BuildContext context, dynamic data);

class UpdatableWidget extends StatefulWidget {
  UpdatableWidget({Key? key, required this.createWidget, this.controller}) : super(key: key);

  CreateWidget createWidget;
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

class UpdatableWidgetController extends ChangeNotifier {
  dynamic data;

  void setValue(dynamic data) {
    this.data = data;
    notifyListeners();
  }
}
