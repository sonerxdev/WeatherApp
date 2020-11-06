import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_place_holder_training/core/contex_extension.dart';
import 'package:json_place_holder_training/core/text.dart';
import 'package:json_place_holder_training/mvvm/detail_page.dart';
import 'package:json_place_holder_training/mvvm/json.dart';
import 'package:json_place_holder_training/mvvm/json_view_model.dart';
import 'package:flutter/cupertino.dart';

class JsonView extends JsonViewModel {
  final int _numPages = 1;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool isUploadingData = false;

  // var getInfo = WeatherModel();

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.greenAccent,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          // centerTitle: false,
        ),
        body: postModels.isEmpty
            ? Center(
                child: CupertinoAlertDialog(
                content: LinearProgressIndicator(
                  minHeight: 8.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  backgroundColor: Colors.blue,
                ),
              ))
            : bodyUI());
  }

  ListView bodyUI() {
    return ListView.builder(
      itemCount: postModels.length,
      itemBuilder: (context, index) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                postModels[index].todaybackgroundGif,
              ),
            ),
          ),
          child: Padding(
            padding: context.paddingLow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: context.dynamicHeight(0.9),
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: context.paddingLow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: context.dynamicWidth(0.20),
                                ),
                                Expanded(
                                  child: FittedBox(
                                    child:
                                        LabelText(postModels[index].firtsArea),
                                  ),
                                ),
                                SizedBox(
                                  width: context.dynamicWidth(0.20),
                                ),
                                Expanded(
                                    child: Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ))
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextDegree(
                                        postModels[index].firstAreaTodayDegree),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 35.0),
                                      child: LabelText("°C"),
                                    )
                                  ],
                                ),
                                LabelText(
                                    postModels[index].firstAreaTodayStatus),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  // padding: context.paddingLow,
                                  //margin: context.paddingLow,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      LabelTextDetail("Daha fazla ayrıntı"),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                          size: 14.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  // padding: context.paddingLow,
                                  //margin: context.paddingLow,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      LabelText("Bugün · "),
                                      LabelText(postModels[index]
                                          .firstAreaTodayStatus),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 130.0),
                                        child: Row(
                                          children: [
                                            LabelText(
                                                postModels[index].todayDegree),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  //  padding: context.paddingLow,
                                  //  margin: context.paddingLow,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      LabelText("Yarın · "),
                                      FittedBox(
                                          child: LabelText(postModels[index]
                                              .tomorrowStatus)),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 130.0),
                                        child: Row(
                                          children: [
                                            FittedBox(
                                              child: LabelText(postModels[index]
                                                  .tomorrowDegree),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: context.dynamicHeight(0.06),
                                  width: context.dynamicWidth(0.8),
                                  child: RaisedButton(
                                      color: Color(0xff5986bb),
                                      child: Text(
                                          "5 günlük hava durumu tahmini",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .copyWith(color: Colors.white)),
                                      onPressed: () {},
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: BorderSide(
                                          color: Color(0xff5986bb),
                                        ),
                                      ),
                                      padding: context.paddingLow),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.paddingLow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: context.dynamicWidth(0.20),
                                ),
                                Expanded(
                                  child: FittedBox(
                                      child: LabelText(
                                          postModels[index].secondArea)),
                                ),
                                SizedBox(
                                  width: context.dynamicWidth(0.20),
                                ),
                                Expanded(
                                    child: Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                ))
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextDegree(postModels[index]
                                        .secondAreaTodayDegree),
                                    Container(
                                      padding: EdgeInsets.only(bottom: 35.0),
                                      child: LabelText("°C"),
                                    )
                                  ],
                                ),
                                LabelText(
                                    postModels[index].firstAreaTodayStatus),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  //  padding: context.paddingLow,
                                  // margin: context.paddingLow,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      LabelTextDetail("Daha fazla ayrıntı"),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                          size: 14.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  // padding: context.paddingLow,
                                  // margin: context.paddingLow,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      LabelText("Bugün · "),
                                      LabelText(postModels[index]
                                          .firstAreaTodayStatus),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 130.0),
                                        child: Row(
                                          children: [
                                            LabelText(postModels[index]
                                                .tomorrowDegree),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  //  padding: context.paddingLow,
                                  // margin: context.paddingLow,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      LabelText("Yarın · "),
                                      FittedBox(
                                          child: LabelText(postModels[index]
                                              .tomorrowStatus)),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 130.0),
                                        child: Row(
                                          children: [
                                            FittedBox(
                                              child: LabelText(postModels[index]
                                                  .tomorrowDegree),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: context.dynamicHeight(0.06),
                                  width: context.dynamicWidth(0.8),
                                  child: RaisedButton(
                                      color: Color(0xff5986bb),
                                      child: Text(
                                          "5 günlük hava durumu tahmini",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .copyWith(color: Colors.white)),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Json1()));
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        side: BorderSide(
                                          color: Color(0xff5986bb),
                                        ),
                                      ),
                                      padding: context.paddingLow),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
