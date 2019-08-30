import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FlushbarStatus flushbarStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flushbar test"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              key: Key("flushbar_buttom"),
              child: Text(
                'Flushbar',
                key: Key("flushbar_buttom_text"),
              ),
              onPressed: () => showFloatingFlushbar(context),
            ),
            new DefaultSnackbarButtom(),
          ],
        ),
      ),
    );
  }

  void showFloatingFlushbar(BuildContext context) {
    if (flushbarStatus != FlushbarStatus.IS_APPEARING &&
        flushbarStatus != FlushbarStatus.SHOWING &&
        flushbarStatus != FlushbarStatus.IS_HIDING) {
      Flushbar(
        margin: EdgeInsets.all(8),
        borderRadius: 8,
        forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
        reverseAnimationCurve: Curves.decelerate,
        // icon: Icon(
        //   Icons.info_outline,
        //   size: 28.0,
        //   color: Colors.white,
        // ),
        title: 'This is a floating Flushbar',
        messageText: Text(
          'Lorem ipsum dolor sit amet',
          style: TextStyle(color: Colors.white),
          key: Key('flushbar_text'),
        ),
        duration: Duration(milliseconds: 1500),
        onStatusChanged: (FlushbarStatus status) {
          setState(() {
            flushbarStatus = status;
          });
        },
      )..show(context);
    }
  }
}

class DefaultSnackbarButtom extends StatelessWidget {
  const DefaultSnackbarButtom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      key: Key("snackbar_buttom"),
      child: Text(
        'Default snackbar',
      ),
      onPressed: () => showDefaultSnackbar(context),
    );
  }

  void showDefaultSnackbar(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: Duration(milliseconds: 1500),
        content: Text(
          'Default snackbar',
          key: Key("snackbar_text"),
        ),
      ),
    );
  }
}
