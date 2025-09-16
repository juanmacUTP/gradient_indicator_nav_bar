import 'package:example/pages/home_page.dart';
import 'package:example/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:gradient_indicator_nav_bar/gradient_indicator_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Example(),
    );
  }
}

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int index = 0;

  List<Widget> pages = [
    HomePage(),
    ProfilePage()
  ];

  List<NavBarItem> items = [
    NavBarItem(icon: Icons.home, label: 'Home'),
    NavBarItem(icon: Icons.person, label: 'Profile')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomNavBar(items: [], onChanged: (value){
        _onChanged(value);
      },),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 1200),
        child: pages[index],
      ),
    );
  }

  void _onChanged(int value) {
    index = value;
    setState(() {});
  }
}