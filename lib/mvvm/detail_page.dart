import 'package:flutter/material.dart';
import 'package:json_place_holder_training/mvvm/json_view_model.dart';

class DetailPage extends JsonViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) =>
            Center(child: Text(postModels[index].fifthdayDegree)),
      ),
    );
  }
}
