import 'package:material_ui/material_ui.dart';
import 'package:gradient_indicator_nav_bar/gradient_indicator_nav_bar.dart';
import 'package:provider/provider.dart';

import '/pages/home_page.dart';
import '/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavBarController(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const Example(),
      ),
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

  List<Widget> pages = [HomePage(), ProfilePage()];

  List<NavBarItem> items = [
    NavBarItem(icon: Icons.home, label: 'Home'),
    NavBarItem(icon: Icons.person, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomNavBar(
        indicatorBorderRadius: .circular(8),
        items: items,
        onChanged: (value) {
          _onChanged(value);
        },
        textStyleBuilder: (isSelected){
          return TextStyle(
            color: isSelected? Colors.white : Colors.grey,
            fontSize: 12,
            fontWeight: isSelected? .w700 : null,
          );
        },
      ),
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
