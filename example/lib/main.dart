import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  Duration _duration = Duration(seconds: 172800);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldMessengerKey,
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Slide direction Up'),
            SlideCountdownClock(
              duration: Duration(days: 20, minutes: 1000000),
              slideDirection: SlideDirection.up,
              separator: ":",
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              shouldShowDays: true,
              onDone: () {
                scaffoldMessengerKey.currentState
                    .showSnackBar(SnackBar(content: Text('Clock 1 finished')));
              },
            ),
            _buildSpace(),
            Text('Slide direction Down'),
            SlideCountdownClock(
              duration: _duration,
              slideDirection: SlideDirection.down,
              separator: ":",
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              onDone: () {
                scaffoldMessengerKey.currentState
                    .showSnackBar(SnackBar(content: Text('Clock 1 finished')));
              },
            ),
            _buildSpace(),
            Text('Use box Decoration'),
            Container(
              color: Colors.transparent,
              // height: 50,
              child: SlideCountdownClock(
                duration: _duration,
                slideDirection: SlideDirection.down,
                separator: ":",
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                separatorTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFEDB000E),
                ),
                padding:
                EdgeInsets.symmetric(horizontal: 0, vertical: 3),
                decoration: BoxDecoration(
                    color: Color(0xFEDB000E),
                    borderRadius: BorderRadius.circular(8),
                    shape: BoxShape.rectangle),
                tightLabel: false,
                shouldShowDays: true,
                onDone: () {

                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpace() {
    return SizedBox(height: 50);
  }
}
