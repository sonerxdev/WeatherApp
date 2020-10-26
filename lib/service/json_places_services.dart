import 'package:json_place_holder_training/model/weather_model.dart';
import 'package:json_place_holder_training/service/base_service.dart';

class JsonPlaceServices extends BaseService {
  Future<List<WeatherModel>> getPosts() async {
    return await get<WeatherModel>("weather.json", model: WeatherModel());
  }
}
