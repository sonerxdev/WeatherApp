import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_place_holder_training/model/weather_model.dart';
import 'package:json_place_holder_training/mvvm/json_view_model.dart';

class JsonView extends JsonViewModel {
  final int _numPages = 2;
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
        color: isActive ? Colors.white : Color(0xFF7B51D3),
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
      body: ListView.builder(
        itemBuilder: (context, index) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 600.0,
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
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                  // child: Text(getInfo.fifthdayAirway.toString()),
                                  ),
                              SizedBox(height: 30.0),
                              Text(postModels[index].fifthdayAirway),
                              SizedBox(height: 15.0),
                              Text(
                                'Çektiğiniz belgeler online olarak saklanır.',
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 30.0),
                              Text(
                                'Karaevli ile işlerinizi kolaylaştırın!',
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                'Gördüğünüz belgeleri hemen tarayarak "Text" haline getirin.',
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                  // child: Image(
                                  // image: AssetImage(
                                  // 'assets/image3.png',
                                  // ),
                                  // height: 300.0,
                                  // width: 300.0,
                                  //),
                                  ),
                              SizedBox(height: 30.0),
                              Text(
                                'Taradığınız yazıları paylaşın!',
                              ),
                              SizedBox(height: 15.0),
                              Text(
                                'Karaevli Google Firebase teknolojisini kullanır ve taradığınız belgeleri hızlıca paylaşabilmenizi sağlar.',
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
      ),
    );
  }
}
