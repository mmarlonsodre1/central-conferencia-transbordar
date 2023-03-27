import 'package:central_conf_transbordar/strings.dart';
import 'package:central_conf_transbordar/ui_ext.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Central do Avivamento',
      theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: primaryColor,
          fontFamily: 'Neue Machina'
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var constraints = const BoxConstraints();
  final headerKey = GlobalKey();
  final bodyTextKey = GlobalKey();
  final passportKey = GlobalKey();
  final faqKey = GlobalKey();
  double scrollPosition = 0.0;
  late ScrollController _controller;

  _scrollListener() {
    setState(() {
      scrollPosition = _controller.position.pixels;
    });
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (context, BoxConstraints constraints) {
            this.constraints = constraints;
            return Stack(
              children: [
                Image.asset(
                  'assets/bg.webp',
                  width: double.maxFinite,
                  height: double.maxFinite,
                  fit: BoxFit.fill,
                ),
                constraints.maxWidth <= 420
                    ? InteractiveViewer(
                  maxScale: 1.5,
                  child: _body(),
                )
                    : _body(),
                _menu()
              ],
            );
          }
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      controller: _controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _scrollWidget(headerKey, _header()),
          _scrollWidget(bodyTextKey, _bodyText()),
          _date(),
          _scrollWidget(passportKey, _passport()),
          _scrollWidget(faqKey, _faq()),
          _footer(),
        ],
      ),
    );
  }

  Widget _scrollWidget(key, widget) {
    return Container(
      key: key,
      child: widget,
    );
  }

  Widget _header() {
    return Image.network(
      'https://raw.githubusercontent.com/mmarlonsodre1/central-conferencia-transbordar/master/assets_remote/header.png',
      semanticLabel: 'Banner conferência transbordar',
      height: constraints.maxWidth / 1.408,
      width: constraints.maxWidth,
      fit: BoxFit.fitWidth,
      loadingBuilder: _loadingBuilder(),
    );
  }

  Widget _menu() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: scrollPosition > 50 ? primaryColor : Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.percent,
          vertical: _getSize(
              [2.percent, 3.percent, 3.percent]
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _menuButton('HOME', headerKey.currentContext ?? context),
            _menuButton('SOBRE', bodyTextKey.currentContext ?? context),
            _menuButton('PASSAPORTE', passportKey.currentContext ?? context),
            _menuButton('DÚVIDAS', faqKey.currentContext ?? context),
          ],
        ),
      ),
    );
  }

  Widget _menuButton(title, widgetContext) {
    return TextButton(
        onPressed: () => Scrollable.ensureVisible(
            widgetContext,
            duration: const Duration(milliseconds: 500)
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: _getSize(
              [8, 1.8.percent, 1.8.percent]
            ),
          ),
        )
    );
  }

  ImageLoadingBuilder _loadingBuilder() {
    return (BuildContext context, Widget child,
        ImageChunkEvent? loadingProgress) {
      if (loadingProgress == null) return child;
      return Center(
        child: CircularProgressIndicator(
          color: Colors.white,
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
              loadingProgress.expectedTotalBytes!
              : null,
        ),
      );
    };
  }

  Widget _bodyText() {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.percent, right: 15.percent,
        bottom: _getSize(
            [8.percent, 6.percent, 4.percent]
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: Colors.white,
          fontSize: _getSize(
              [12, 2.3.percent, 2.1.percent]
          ),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _date() {
    return Stack(
      children: [
        Image.network(
          'https://raw.githubusercontent.com/mmarlonsodre1/central-conferencia-transbordar/master/assets_remote/date.png',
          height: constraints.maxWidth / 3.894,
          width: constraints.maxWidth,
          loadingBuilder: _loadingBuilder(),
        ),
        Positioned(
          top: 3.percent,
          bottom: 3.percent,
          left: 22.percent,
          right: 22.percent,
          child: Container(
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.65),
              borderRadius: BorderRadius.circular(2.5.percent),
              border: Border.all(
                  color: Colors.white,
                  width: 0.1.percent
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: _getSize(
                      [8, 10, 12.0]
                  ),
                  horizontal: 20.0
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '21 E 22 DE ABRIL',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: _getSize(
                              [13, 2.3.percent, 2.1.percent]
                          )
                      ),
                    ),
                    SizedBox(
                      height: 2.percent,
                    ),
                    Text(
                      '"EM VOCÊ E ATRAVÉS DE VOCÊ."',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: _getSize(
                              [8, 2.3.percent, 2.1.percent]
                          ),
                          fontWeight: FontWeight.w300,
                          wordSpacing: 1.percent
                      ),
                    ),
                    SizedBox(
                        height: 2.percent
                    ),
                    _button(
                      'INSCREVA-SE',
                          () {},
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _button(title, onPress) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.white,
              offset: const Offset(0, 1),
              blurRadius: 2.percent
          )
        ],
        borderRadius: BorderRadius.circular(2.percent),
        color: Colors.white,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(2.percent),
        color: Colors.white,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(2.percent),
          child: Container(
            height: _getSize(
                [4.percent, 3.5.percent, 3.percent]
            ),
            width: _getSize(
                [17.percent, 16.percent, 15.percent]
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.percent),
              color: Colors.white,
            ),
            child: Text(
              title,
              style: TextStyle(
                color: primaryColor,
                fontSize: _getSize(
                    [7, 11, 0.8.percent]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _passport() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 15.percent,
          vertical: _getSize(
              [8.percent, 6.percent, 4.percent]
          )
      ),
      child: Row(
        children: [
          Image.network(
            'https://raw.githubusercontent.com/mmarlonsodre1/central-conferencia-transbordar/master/assets_remote/passport.png',
            width: _getSize(
                [53.percent, 53.percent, 55.percent]
            ),
          ),
          _button(
              'COMPRAR',
                  () {}
          )
        ],
      ),
    );
  }

  Widget _faq() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 7.5.percent
      ),
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(2.5.percent),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 7.5.percent
          ),
          child: Column(
            children: [
              SizedBox(
                height: 5.percent,
              ),
              Text(
                'PERGUNTAS FREQUENTES',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 3.percent
                ),
              ),
              SizedBox(
                height: 1.3.percent,
              ),
              Container(
                color: Colors.white,
                height: _getSize(
                    [0.1.percent, 0.1.percent, 0.05.percent]
                ),
                width: 27.percent,
              ),
              SizedBox(
                height: 2.5.percent,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: faQuestions.keys.length,
                  itemBuilder: (context, index) {
                    return _item(
                      faQuestions.keys.elementAt(index),
                      faQuestions.values.elementAt(index),
                      index
                    );
                  }
              ),
              SizedBox(
                height: 7.percent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  var visibilityList = List.generate(10, (index) => false);

  Widget _item(title, description, index) {
    return StatefulBuilder(
        builder: (context, setState) {
          return GestureDetector(
            onTap: () =>
                setState(() {
                  visibilityList[index] = !visibilityList[index];
                }),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: _getSize(
                                [7, 14, 2.percent]
                            ),
                            color: Colors.white
                        ),
                      ),
                    ),
                    SizedBox(width: 2.percent,),
                    Image.asset(
                        height: _getSize(
                            [1.percent, 1.percent, 0.5.percent]
                        ),
                        width: _getSize(
                            [1.2.percent, 1.2.percent, 0.6.percent]
                        ),
                        visibilityList[index] ? 'assets/minus.webp' : 'assets/arrow.webp'
                    )
                  ],
                ),
                AnimatedOpacity(
                  opacity: visibilityList[index] ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Visibility(
                      visible: visibilityList[index],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 1.percent,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                  width: _getSize(
                                      [1.percent, 1.percent, 0.6.percent]
                                  ),
                                  'assets/minus.webp'
                              ),
                              SizedBox(width: 0.5.percent,),
                              Expanded(
                                child: Text(
                                  description,
                                  style: TextStyle(
                                      fontSize: _getSize(
                                          [6, 12, 1.percent]
                                      ),
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                ),
                SizedBox(height: 1.percent,),
                Container(
                  color: Colors.white,
                  height: _getSize(
                      [0.1.percent, 0.1.percent, 0.05.percent]
                  ),
                  width: double.maxFinite,
                ),
                SizedBox(height: 1.5.percent,),
              ],
            ),
          );
        }
    );
  }

  Widget _footer() {
    return Padding(
      padding: EdgeInsets.only(
          top: 12.percent
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.network(
            'https://raw.githubusercontent.com/mmarlonsodre1/central-conferencia-transbordar/master/assets_remote/footer.png',
            height: constraints.maxWidth / 9.056,
            width: constraints.maxWidth,
            loadingBuilder: _loadingBuilder(),
          ),
          Image.network(
            'https://raw.githubusercontent.com/mmarlonsodre1/central-conferencia-transbordar/master/assets_remote/footer_persons.png',
            fit: BoxFit.fitWidth,
            height: constraints.maxWidth / 6.5979,
            width: constraints.maxWidth,
            loadingBuilder: _loadingBuilder(),
          )
        ],
      ),
    );
  }

  double _getSize(List<double> list) {
    if (constraints.maxWidth <= 420) {
      return list[0];
    } else if (constraints.maxWidth <= 1280) {
      return list[1];
    } else {
      return list[2];
    }
  }
}
