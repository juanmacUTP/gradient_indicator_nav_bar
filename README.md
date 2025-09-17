# Gradient Indicator Bottom Nav Bar
> Looking for a bottom navigation bar with a gradient background? Here it is: Gradient Indicator Bottom Nav Bar.

Implement a beautiful bottom navigation bar with a selection indicator and a gradient background.

Just provide the icons with their labels and you’re ready to go. 🚀

## Screenshots

<div style="display: flex; justify-content: center; gap: 20px;">
  <img src="https://github.com/user-attachments/assets/5392a383-52f3-4235-8665-57333ad58c10" 
       alt="Home Page selected" width="250"/>
  <img src="https://github.com/user-attachments/assets/8b45bb7b-8dae-443f-8653-6442bf62f942" 
       alt="Profile Page selected" width="250"/>
</div>

## Getting Started

1. Install the dependency:

    ```bash
    flutter pub add gradient_indicator_nav_bar
    ```

2. Import the package:

    ```dart
    import 'package:gradient_indicator_nav_bar/gradient_indicator_nav_bar.dart';
    ```

3. Create the Provider controller:

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

4. Add the CustomNavBar in your `Scaffold` in the  `bottomNavigationBar` item:

    ```dart
    class Example extends StatefulWidget {
      const Example({super.key});

      @override
      State<Example> createState() => _ExampleState();
    }

    class _ExampleState extends State<Example> {
      int index = 0;

      final List<Widget> pages = [
        HomePage(),
        ProfilePage(),
      ];

      final List<NavBarItem> items = [
        NavBarItem(icon: Icons.home, label: 'Home'),
        NavBarItem(icon: Icons.person, label: 'Profile'),
      ];

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: CustomNavBar(
            height: 90,
            items: items,
            onChanged: (value) {
              _onChanged(value);
            },
          ),
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 1200),
            child: pages[index],
          ),
        );
      }

      void _onChanged(int value) {
        setState(() {
          index = value;
        });
      }
    }
    ```

```

