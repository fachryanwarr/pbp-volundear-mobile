import 'package:flutter/material.dart';
import 'package:volundear/drawer.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LandingPage 7',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  final String title = 'Program LandingPage';

  @override
  State<LandingPage> createState() => _LandingPageState();
  }

class _LandingPageState extends State<LandingPage> {
  int _LandingPage = 0;

  void _incrementLandingPage() {
    setState(() {
      _LandingPage++;
    });
  }

  void _decrementLandingPage() {
    setState(() {
      _LandingPage--;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Menambahkan drawer menu
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_LandingPage % 2 == 0) 
              const Text(
                'GENAP',
                style: TextStyle(color: Colors.blue),
              )
            else 
              const Text(
              'GANJIL',
              style: TextStyle(color: Colors.red),
            ),
            Text(
              '$_LandingPage',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_LandingPage > 0)
            Padding(padding: const EdgeInsets.only(left: 30),
              child: FloatingActionButton(
                onPressed: _decrementLandingPage,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
            ),
          Padding(padding: const EdgeInsets.only(left: 30),
            child: FloatingActionButton(
              onPressed: _incrementLandingPage,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
