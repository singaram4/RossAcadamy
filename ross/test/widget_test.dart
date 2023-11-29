import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feminine Health',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton('HedhiHelp', HedhiHelpScreen(), Colors.blue),
          CustomButton('OmwanaThrive', OmwanaThriveScreen(), Colors.green),
          CustomButton('ObulamuEats', ObulamuEatsScreen(), Colors.orange),
          CustomButton('SengaSafe', SengaSafeScreen(), Colors.red),
          CustomButton('Omuwala Power', OmuwalaPowerScreen(), Colors.purple),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Widget screen;
  final Color color;

  CustomButton(this.buttonText, this.screen, this.color);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

// Placeholder screens, replace these with your actual screen implementations
class HedhiHelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HedhiHelp Screen'),
      ),
      body: Center(
        child: Text('HedhiHelp Content Goes Here'),
      ),
    );
  }
}

class OmwanaThriveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OmwanaThrive Screen'),
      ),
      body: Center(
        child: Text('OmwanaThrive Content Goes Here'),
      ),
    );
  }
}

class ObulamuEatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ObulamuEats Screen'),
      ),
      body: Center(
        child: Text('ObulamuEats Content Goes Here'),
      ),
    );
  }
}

class SengaSafeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SengaSafe Screen'),
      ),
      body: Center(
        child: Text('SengaSafe Content Goes Here'),
      ),
    );
  }
}

class OmuwalaPowerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Omuwala Power Screen'),
      ),
      body: Center(
        child: Text('Omuwala Power Content Goes Here'),
      ),
    );
  }
}
