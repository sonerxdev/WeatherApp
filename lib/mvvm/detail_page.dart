import 'package:flutter/material.dart';
import 'package:json_place_holder_training/core/contex_extension.dart';
import 'package:json_place_holder_training/core/text.dart';
import 'package:json_place_holder_training/mvvm/json.dart';
import 'package:json_place_holder_training/mvvm/json_view_model.dart';
import 'package:weather_icons/weather_icons.dart';

class DetailPage extends JsonViewModel1 {
  @override
  void initState() {
    super.initState();

    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: AppbarText("5 günlük hava durumu"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Json(),
              ),
            );
          },
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: postModels.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                //  minHeight: 8.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                backgroundColor: Colors.white,
              ),
            )
          : ListView.builder(
              itemCount: postModels.length,
              itemBuilder: (context, index) => Container(
                  color: Colors.black,
                  height: context.dynamicHeight(0.80),
                  width: context.dynamicWidth(0.09),
                  margin: context.paddingHigh,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: context.dynamicHeight(0.03),
                                ),
                                DetailPageText("Dün"),
                                SizedBox(
                                  height: context.dynamicHeight(0.01),
                                ),
                                DetailPageText(
                                    postModels[index].yesterdayDegree),
                                SizedBox(
                                  height: context.dynamicHeight(0.05),
                                ),
                                Icon(
                                  Icons.circle,
                                  color: Colors.yellow,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: AppbarText(postModels[index].day),
                          ),
                          Expanded(
                            child: AppbarText(postModels[index].day),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.cloud,
                                  color: Colors.white60,
                                ),
                                SizedBox(
                                  height: context.dynamicHeight(0.05),
                                ),
                                WindIcon(
                                  degree: 70,
                                  color: Colors.white,
                                ),
                                DetailPageText(
                                    postModels[index].yesterdayAirway),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: context.dynamicWidth(0.07),
                      ),
                      Container(
                        height: context.dynamicHeight(0.1),
                        width: context.dynamicWidth(0.2),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: context.dynamicHeight(0.03),
                                  ),
                                  DetailPageText("Bugün"),
                                  SizedBox(
                                    height: context.dynamicHeight(0.01),
                                  ),
                                  DetailPageText(postModels[index].todayDegree),
                                  SizedBox(
                                    height: context.dynamicHeight(0.05),
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: AppbarText(postModels[index].day),
                            ),
                            Expanded(
                              child: AppbarText(postModels[index].day),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.nights_stay_sharp,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(
                                    height: context.dynamicHeight(0.05),
                                  ),
                                  WindIcon(
                                    degree: 120,
                                    color: Colors.white,
                                  ),
                                  DetailPageText(postModels[index].todayAirway),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: context.dynamicWidth(0.07),
                      ),
                      Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: context.dynamicHeight(0.03),
                                ),
                                DetailPageText("Yarın"),
                                SizedBox(
                                  height: context.dynamicHeight(0.01),
                                ),
                                DetailPageText(
                                    postModels[index].tomorrowDegree),
                                SizedBox(
                                  height: context.dynamicHeight(0.05),
                                ),
                                BoxedIcon(
                                  WeatherIcons.rain_mix,
                                  color: Colors.blueAccent,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: AppbarText(postModels[index].day),
                          ),
                          Expanded(
                            child: AppbarText(postModels[index].day),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                BoxedIcon(
                                  WeatherIcons.cloudy,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: context.dynamicHeight(0.05),
                                ),
                                WindIcon(
                                  degree: 90,
                                  color: Colors.white,
                                ),
                                DetailPageText(
                                    postModels[index].tomorrowAirway),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: context.dynamicWidth(0.07),
                      ),
                      Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: context.dynamicHeight(0.03),
                                ),
                                DetailPageText("Pzt"),
                                SizedBox(
                                  height: context.dynamicHeight(0.01),
                                ),
                                DetailPageText(
                                    postModels[index].thirthdayDegree),
                                SizedBox(
                                  height: context.dynamicHeight(0.05),
                                ),
                                BoxedIcon(
                                  WeatherIcons.day_cloudy,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: AppbarText(postModels[index].day),
                          ),
                          Expanded(
                            child: AppbarText(postModels[index].day),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                BoxedIcon(
                                  WeatherIcons.moon_waning_crescent_3,
                                  color: Colors.yellow,
                                ),
                                SizedBox(
                                  height: context.dynamicHeight(0.05),
                                ),
                                WindIcon(
                                  degree: 158,
                                  color: Colors.white,
                                ),
                                DetailPageText(
                                    postModels[index].thirthdayAirway),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: context.dynamicWidth(0.07),
                      ),
                      Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: context.dynamicHeight(0.03),
                                ),
                                DetailPageText("Sal"),
                                SizedBox(
                                  height: context.dynamicHeight(0.01),
                                ),
                                DetailPageText(
                                    postModels[index].fifthdayDegree),
                                SizedBox(
                                  height: context.dynamicHeight(0.05),
                                ),
                                Icon(
                                  Icons.circle,
                                  color: Colors.yellow,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: AppbarText(postModels[index].day),
                          ),
                          Expanded(
                            child: AppbarText(postModels[index].day),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                BoxedIcon(
                                  WeatherIcons.night_lightning,
                                  color: Colors.blueAccent,
                                ),
                                SizedBox(
                                  height: context.dynamicHeight(0.05),
                                ),
                                WindIcon(
                                  degree: 200,
                                  color: Colors.white,
                                ),
                                DetailPageText(
                                    postModels[index].fifthdayAirway),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
    );
  }
}
