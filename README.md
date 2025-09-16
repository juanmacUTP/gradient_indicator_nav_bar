# Gradient Indicator Bottom Nav Bar
> Want a bottom navigation bar with gradient background? Here is Gradient Indicator Bottom Nav Bar.

Implement a beatiful bottom navigation bar with selection indicator and grandient background.

Just push the icons with their labels and get ready for action.

## Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/5392a383-52f3-4235-8665-57333ad58c10" alt="Home Page selected" width="250"/>
  <img src="https://github.com/user-attachments/assets/8b45bb7b-8dae-443f-8653-6442bf62f942" alt="Profile Page selected" width="250"/>
</p>

## Getting Started

1. Install the dependency:
```
  $ flutter pub add gradient_indicator_nav_bar
```

2. Import the package:
```
import 'package:gradient_indicator_nav_bar/gradient_indicator_nav_bar.dart'
```

3. Create de Provider controller:
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavBarController(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const Example(),
      ),
    );
  }
}
```
4. Replace your Scaffold AppBar with GradientAppBar.
```dart

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

```
