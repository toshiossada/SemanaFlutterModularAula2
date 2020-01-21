import 'package:aula_0/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeController = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
      ),
      body: Center(
        child: TextField(
          onChanged: (value) {
            _homeController.text = value;
          },
          decoration: InputDecoration(labelText: 'Digite seu nome'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.adjust),
        onPressed: () {
          Modular.to.pushNamed('/other/${_homeController.text}');
        },
      ),
    );
  }
}
