import 'package:flutter/services.dart' show rootBundle;
import 'package:tickets/core/errors/exceptions.dart';


class SimulateApiClient {
  static Future<dynamic> get(path)async{
    final String jsonString = await rootBundle.loadString(path);
    if(jsonString.trim().isNotEmpty){
      return jsonString;
    }else{
      throw ServerException("Data not found");
    }
  }
}