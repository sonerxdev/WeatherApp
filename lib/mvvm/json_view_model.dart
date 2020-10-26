import 'package:flutter/material.dart';
import 'package:json_place_holder_training/model/weather_model.dart';
import 'package:json_place_holder_training/mvvm/json.dart';
import 'package:json_place_holder_training/service/json_places_services.dart';

abstract class JsonViewModel extends State<Json> {
  List<WeatherModel> postModels = [];

  String errorMessage = "";
  bool isLoading = false;
  JsonPlaceServices jsonPlaceServices;

  @override
  void initState() {
    super.initState();
    jsonPlaceServices = JsonPlaceServices();
  }

  Future<void> getPosts() async {
    changeLoading();

    try {
      postModels = await jsonPlaceServices.getPosts();
    } on Exception catch (e) {
      showErrorDialog(e.toString());
    }

    changeLoading();
  }

  void showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: Text(message),
            ));
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
