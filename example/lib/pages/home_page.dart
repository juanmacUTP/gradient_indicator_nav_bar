import 'package:material_ui/material_ui.dart';

class HomePage extends StatelessWidget{

    const HomePage({super.key});

    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text('Home Page')
        )
      );
    }

}