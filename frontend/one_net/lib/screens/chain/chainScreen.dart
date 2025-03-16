import 'package:flutter/material.dart';

class ChainScreen extends StatefulWidget {
  const ChainScreen({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  State<StatefulWidget> createState() => _ChainScreenState();
}

class _ChainScreenState extends State<ChainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChainScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Welcome to the Chain screen'),
      ),
    );
  }
}
