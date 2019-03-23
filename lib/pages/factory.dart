import 'package:flutter/material.dart';

class FactoryPage extends StatefulWidget {
  final int id;

  const FactoryPage({Key key, this.id}) : super(key: key);

  @override
  _FactoryPageState createState() => _FactoryPageState();
}

class _FactoryPageState extends State<FactoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Factory ${widget.id}'),
      ),
    );
  }
}
