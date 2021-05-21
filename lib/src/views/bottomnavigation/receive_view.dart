import 'package:flutter/material.dart';

class ReceiveView extends StatefulWidget {
  const ReceiveView() : super();

  @override
  _ReceiveViewState createState() => _ReceiveViewState();
}

class _ReceiveViewState extends State<ReceiveView> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: 'sample text: Receive',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.center,
        child: TextField(controller: _textController),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
