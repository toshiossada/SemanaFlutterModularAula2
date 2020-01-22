import 'package:aula_0/app/shared/models/pokemon_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class PokeRepository {
  final Dio dio;

  PokeRepository({@required this.dio});

  Future<List<PokemonModel>> getAllPokemons() async {
    var response = await dio.get('/pokemon');
    List<PokemonModel> list;
    for (var item in (response.data['result'] as List)) {
      PokemonModel model = PokemonModel(name: item['']);
      list.add(model);
    }

    return list;
  }
}
