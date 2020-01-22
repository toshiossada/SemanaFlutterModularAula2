import 'package:aula_0/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
      body: Observer(
        builder: (_) {
          if (_homeController.pokemons.error != null) {
            return Center(
              child: RaisedButton(
                onPressed: () {
                  _homeController.fetchPokemons();
                },
                child: Text('Press Again'),
              ),
            );
          } else if (_homeController.pokemons.value == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var list = _homeController.pokemons.value;

            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(list[index].name),
                );
              },
            );
          }
        },
      ),
    );
  }
}
