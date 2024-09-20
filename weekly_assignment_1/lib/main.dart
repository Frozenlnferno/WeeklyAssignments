import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FizzBuzz: Week 1 Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'FizzBuzz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _label = '--';

  void updateLabel() {
    if (_counter % 5 == 0 && _counter % 3 == 0) {
      _label = 'fizzbuzz';
    } else if (_counter % 5 == 0) {
      _label = 'buzz';
    } else if (_counter % 3 == 0) {
      _label = 'fizz';
    } else {
      _label = '--';
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      updateLabel();
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      updateLabel();
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      updateLabel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              _label,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              FloatingActionButton(
                onPressed: _resetCounter,
                tooltip: 'Reset',
                child: const Icon(Icons.exposure_zero),
              ),
              FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
