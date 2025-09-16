# Gradient Indicator Bottom Nav Bar
> 

Love the material AppBar? Do you want to add more color to the appbar? Here's a GradientAppBar.

It works just like the normal AppBar. Also with actions, back buttons, titles. So it's just your normal AppBar, but with a twist!

## Screenshots

![image](https://user-images.githubusercontent.com/7083755/43866104-e9bc98ea-9b64-11e8-9115-b2deec915dbd.png)
![image](https://user-images.githubusercontent.com/7083755/43866237-4f8e6a5e-9b65-11e8-8adf-2514a9b1e10c.png)


## Getting Started

1. Install the dependency:
```
  $ flutter pub add gradient_indicator_nav_bar
```

2. Import the package:
```
import 'package:gradient_indicator_nav_bar/gradient_indicator_nav_bar.dart'
```

3. Replace your Scaffold AppBar with GradientAppBar.
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
