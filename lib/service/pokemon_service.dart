import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:lesson28/core/api/api.dart';
import 'package:lesson28/models/pocemon_model.dart';

class PokemonService{
  static Future<PocemonModel> getPocemon()async{
    Response res = await Dio().get(Constants.myApi);
    return PocemonModel.fromJson(jsonDecode(res.data));
  }
}