import 'dart:ui';
import 'package:abheekbday/splash_page.dart';
import 'package:rive/rive.dart' as riv;
import 'package:flutter/material.dart';
import 'package:emailjs/emailjs.dart';



void main() {
  runApp(test());
}

Map<String, dynamic> templateParams = {
  'name': 'Abheek ka Bday',
  'notes': 'Check this out!'
};

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const MyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.gradient = const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        label: child,
        icon: Icon(
          Icons.card_giftcard_rounded,
          color: Colors.white,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Abheeky Point',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: 2000,
        child: SingleChildScrollView(
          child: Stack(
            children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: 1000,
                    child: riv.RiveAnimation.asset(
                                'Images/spine.riv',
                              ),
                  ),
                ),
              Positioned(
                  child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 30,
                  sigmaY: 30,
                ),
                child: SizedBox(
                    // height: 10,
                    ),
              )),
              Padding(
                padding: EdgeInsets.only(left: 50, top: 130),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'Images/abheek.png',
                                height: 700,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'Images/Abheeki.png',
                                height: 700,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'Images/Abheek2.png',
                                height: 700,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'Images/Abheek3.png',
                                height: 700,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'Images/Abheek5.png',
                                height: 700,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                'Images/Abheek4.png',
                                height: 700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Aree Haaan gift laooo Bhai",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: "Mukta",
                            height: 1.2,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      MyElevatedButton(
                        width: 150,
                        onPressed: () async {
                          try {
          await EmailJS.send(
          'service_yut57y8',
          'template_x17lxlh',
          templateParams,
          const Options(
        publicKey: 'xktVMtjenC0J_0zEA',
        privateKey: '3Zu5wPEK9XSfncyjNvuS8',
          ),
        );
        print('SUCCESS!');
      } catch (error) {
        print(error.toString());
      }
                          showDialog(
                              context: context,
                              builder: ((BuildContext context) {
                                return DynamicDialog(
                                    title: 'Check Your Mail Bud (Outlook) ',
                                    body:
                                        'Excited for the Gift Aint Ya Well its not gonna be a Biggie Just a Small push for our side to you');
                              }));
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Text(
                          'Get The Gift',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ]),
              ),
              SafeArea(
                  child: Padding(
                padding: const EdgeInsets.only(left: 32, top: 100),
                child: Column(
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) * 1 / 1.59,
                      child: Column(
                        children: const [
                          Text(
                            "Happy Birthday Abheeky Boiii 🎉🎉 !!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                                fontFamily: "Mukta",
                                height: 1.2,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class DynamicDialog extends StatefulWidget {
  final title;
  final body;
  DynamicDialog({this.title, this.body});
  @override
  _DynamicDialogState createState() => _DynamicDialogState();
}

class _DynamicDialogState extends State<DynamicDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.all(15),
      title: Text(widget.title),
      actions: <Widget>[
        OutlinedButton.icon(
            label: Text(
              'Close',
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.blue,
            ))
      ],
      content: Text(widget.body),
    );
  }
}
