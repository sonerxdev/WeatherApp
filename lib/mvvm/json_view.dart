import 'package:flutter/material.dart';
import 'package:json_place_holder_training/model/weather_model.dart';
import 'package:json_place_holder_training/mvvm/json_view_model.dart';

class JsonView extends JsonViewModel {
  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [],
    ));
  }
}
