import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String html = '''
        <h1>This is heading 1</h1>
        <h2>This is heading 2</h2>
        <h3>This is heading 3</h3>
        <h4>This is heading 4</h4>
        <h5>This is head  ing 5</h5>
        <h6>This is heading 6</h6>
        <a href="https://google.com">Google</a>
        <br>
        <br>
        <a href="https://google.com">Google</a>
        <img alt="Test Image" src="https://source.unsplash.com/random/300x200" width="1500" height="1000"/>
        <br>
        <br>
        <p>This is P 标签</p>
        <br>
        <br>
        <img src="https://source.unsplash.com/random/300x500"/>
        ''';

    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Plugin example app'),
        ),
        body: new Container(
          child: new HtmlView(
            data: html,
            stylingOptions: null,
          ),
        ),
      ),
    );

//    return new MaterialApp(
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Plugin example app'),
//        ),
//        body: new SingleChildScrollView(
//          child: new Center(
//            child: new HtmlView(
//              data: html,
//              baseURL: "https://images.unsplash.com",
//              onLaunchFail: (url) {
//                print("launch $url failed");
//              },
//            ),
//          ),
//        ),
//      ),
//    );
  }
}
