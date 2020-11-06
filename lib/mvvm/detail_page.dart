import 'package:flutter/material.dart';
import 'package:json_place_holder_training/core/contex_extension.dart';
import 'package:json_place_holder_training/mvvm/json_view_model.dart';

class DetailPage extends JsonViewModel {
  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: postModels.length,
        itemBuilder: (context, index) => Container(
          height: context.dynamicHeight(0.02),
          width: context.dynamicWidth(0.01),
          color: Colors.pink,
          child: Text(
            postModels[index].todayDegree,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
