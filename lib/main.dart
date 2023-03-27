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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Neue Machina'
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return Stack(
            children: [
              Image.asset(
                'assets/bg.webp',
                width: double.maxFinite,
                height: double.maxFinite,
                fit: BoxFit.fill,
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _header(),
                    _bodyText(),
                    _date(),
                    _passport(),
                    _faq(),
                    _footer(),
                  ],
                ),
              ),
            ],
          );
        }
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _header() {
    return Stack(
      children: [
        Image.asset(
          'assets/header.webp',
          width: double.maxFinite,
          fit: BoxFit.fitWidth,
        )
      ],
    );
  }

  Widget _bodyText() {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.percent, right: 15.percent,
        bottom: 4.percent
      ),
      child: Text(
        title,
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: Colors.white,
          fontSize: 2.1.percent,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _date() {
    return Stack(
      children: [
        Image.asset(
          'assets/date.webp',
          fit: BoxFit.fitWidth,
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
              padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 24.0
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '21 E 22 DE ABRIL',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 2.5.percent
                      ),
                    ),
                    SizedBox(
                      height: 2.5.percent,
                    ),
                    Text(
                      '"EM VOCÊ E ATRAVÉS DE VOCÊ."',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 2.1.percent,
                          fontWeight: FontWeight.w300,
                          wordSpacing: 1.percent
                      ),
                    ),
                    SizedBox(
                      height: 2.5.percent,
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
            height: 3.percent,
            width: 15.percent,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.percent),
              color: Colors.white,
            ),
            child: Text(
              title,
              style: TextStyle(
                color: primaryColor,
                fontSize: 0.8.percent
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
        vertical: 4.percent
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/passport.webp',
            width: 55.percent,
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
                height: 0.05.percent,
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
                        faQuestions.values.elementAt(index)
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

  Widget _item(title, description) {
    var visibility = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return GestureDetector(
          onTap: () => setState(() {
            visibility = !visibility;
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
                        fontSize: 1.percent,
                        color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(width: 2.percent,),
                  Image.asset(
                    height: 0.5.percent,
                    width: 0.6.percent,
                    visibility ? 'assets/minus.webp' : 'assets/arrow.webp'
                  )
                ],
              ),
              AnimatedOpacity(
                opacity: visibility ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Visibility(
                    visible: visibility,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 1.percent,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                                height: 0.5.percent,
                                width: 0.6.percent,
                                'assets/minus.webp'
                            ),
                            SizedBox(width: 0.2.percent,),
                            Text(
                              description,
                              style: TextStyle(
                                  fontSize: 1.percent,
                                  color: Colors.white
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
                height: 0.05.percent,
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
          Image.asset(
            'assets/footer.webp',
            width: double.maxFinite,
          ),
          Image.asset(
            'assets/footer_persons.webp',
            fit: BoxFit.fitWidth,
          )
        ],
      ),
    );
  }
}
