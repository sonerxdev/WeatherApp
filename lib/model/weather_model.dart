import 'package:json_place_holder_training/model/base_model.dart';

class WeatherModel extends IBaseModel<WeatherModel> {
  String todaybackgroundGif;
  String firtsArea;
  String secondArea;
  int firstAreaTodayDegree;
  int secondAreaTodayDegree;
  String firstAreaTodayStatus;
  String secondAreaTodayStatus;
  String yesterdayDegree;
  String todayDegree;
  String tomorrowDegree;
  String thirthdayDegree;
  String fifthdayDegree;
  String yesterdayStatus;
  String tomorrowStatus;
  String thirthdayStatus;
  String fifthdayStatus;
  String yesterdayAirway;
  String todayAirway;
  String tomorrowAirway;
  String thirthdayAirway;
  String fifthdayAirway;

  WeatherModel(
      {this.todaybackgroundGif,
      this.firtsArea,
      this.secondArea,
      this.firstAreaTodayDegree,
      this.secondAreaTodayDegree,
      this.firstAreaTodayStatus,
      this.secondAreaTodayStatus,
      this.yesterdayDegree,
      this.todayDegree,
      this.tomorrowDegree,
      this.thirthdayDegree,
      this.fifthdayDegree,
      this.yesterdayStatus,
      this.tomorrowStatus,
      this.thirthdayStatus,
      this.fifthdayStatus,
      this.yesterdayAirway,
      this.todayAirway,
      this.tomorrowAirway,
      this.thirthdayAirway,
      this.fifthdayAirway});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    todaybackgroundGif = json['todaybackgroundGif'];
    firtsArea = json['firtsArea'];
    secondArea = json['secondArea'];
    firstAreaTodayDegree = json['firstAreaTodayDegree'];
    secondAreaTodayDegree = json['secondAreaTodayDegree'];
    firstAreaTodayStatus = json['firstAreaTodayStatus'];
    secondAreaTodayStatus = json['SecondAreaTodayStatus'];
    yesterdayDegree = json['yesterdayDegree'];
    todayDegree = json['todayDegree'];
    tomorrowDegree = json['tomorrowDegree'];
    thirthdayDegree = json['thirthdayDegree'];
    fifthdayDegree = json['fifthdayDegree'];
    yesterdayStatus = json['yesterdayStatus'];
    tomorrowStatus = json['tomorrowStatus'];
    thirthdayStatus = json['thirthdayStatus'];
    fifthdayStatus = json['fifthdayStatus'];
    yesterdayAirway = json['yesterdayAirway'];
    todayAirway = json['todayAirway'];
    tomorrowAirway = json['tomorrowAirway'];
    thirthdayAirway = json['thirthdayAirway'];
    fifthdayAirway = json['fifthdayAirway'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['todaybackgroundGif'] = this.todaybackgroundGif;
    data['firtsArea'] = this.firtsArea;
    data['secondArea'] = this.secondArea;
    data['firstAreaTodayDegree'] = this.firstAreaTodayDegree;
    data['secondAreaTodayDegree'] = this.secondAreaTodayDegree;
    data['firstAreaTodayStatus'] = this.firstAreaTodayStatus;
    data['SecondAreaTodayStatus'] = this.secondAreaTodayStatus;
    data['yesterdayDegree'] = this.yesterdayDegree;
    data['todayDegree'] = this.todayDegree;
    data['tomorrowDegree'] = this.tomorrowDegree;
    data['thirthdayDegree'] = this.thirthdayDegree;
    data['fifthdayDegree'] = this.fifthdayDegree;
    data['yesterdayStatus'] = this.yesterdayStatus;
    data['tomorrowStatus'] = this.tomorrowStatus;
    data['thirthdayStatus'] = this.thirthdayStatus;
    data['fifthdayStatus'] = this.fifthdayStatus;
    data['yesterdayAirway'] = this.yesterdayAirway;
    data['todayAirway'] = this.todayAirway;
    data['tomorrowAirway'] = this.tomorrowAirway;
    data['thirthdayAirway'] = this.thirthdayAirway;
    data['fifthdayAirway'] = this.fifthdayAirway;
    return data;
  }

  @override
  WeatherModel fromJson(Map<String, Object> json) {
    return WeatherModel.fromJson(json);
  }
}
