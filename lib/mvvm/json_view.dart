import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_place_holder_training/core/contex_extension.dart';
import 'package:json_place_holder_training/core/text.dart';
import 'package:json_place_holder_training/mvvm/json_view_model.dart';

class JsonView extends JsonViewModel {
  final int _numPages = 1;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

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
        color: isActive ? Colors.white : Colors.black,
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
      body: bodyUI(),
    );
  }

  ListView bodyUI() {
    return ListView.builder(
      itemCount: postModels.length,
      itemBuilder: (context, index) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
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
                  height: context.dynamicHeight(0.99),
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
                                  child: Icon(Icons.add),
                                ),
                                SizedBox(
                                  width: context.dynamicWidth(0.20),
                                ),
                                Expanded(
                                  child: LabelText(postModels[index].firtsArea),
                                ),
                                SizedBox(
                                  width: context.dynamicWidth(0.20),
                                ),
                                Expanded(child: Icon(Icons.more_vert))
                              ],
                            ),
                            Column(
                              children: [],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.paddingLow,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: context.dynamicHeight(0.02)),
                            Text(
                              'Karaevli ile işlerinizi kolaylaştırın!',
                            ),
                            SizedBox(height: context.dynamicHeight(0.02)),
                            Text(
                              'Gördüğünüz belgeleri hemen tarayarak "Text" haline getirin.',
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
