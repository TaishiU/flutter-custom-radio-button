import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Radio Button'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Next'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomRadio()),
            );
          },
        ),
      ),
    );
  }
}

class CustomRadio extends StatefulWidget {
  @override
  createState() {
    return new CustomRadioState();
  }
}

class CustomRadioState extends State<CustomRadio> {
  List<RadioModel> sampleData = <RadioModel>[];

  //書き込み set(key, true);
  //読み込み get(key) ?? false ;  //falseはデータがないときの初期値

  // _saveBool1() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('option1', false);
  // }
  //
  // _saveBool2() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('option2', true);
  // }
  //
  // _restoreValues1() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   prefs.getBool('option1');
  // }
  //
  // _restoreValues2() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   prefs.getBool('option2');
  // }

  @override
  void initState() {
    super.initState();
    sampleData.add(new RadioModel(true, '日本語'));
    sampleData.add(new RadioModel(false, '英語'));
    // _restoreValues1();
    // _restoreValues2();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListItem"),
      ),
      body: new ListView.builder(
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            //highlightColor: Colors.red,
            splashColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                sampleData.forEach(
                  (element) => element.isSelected = false,
                );
                // _saveBool1();
                sampleData[index].isSelected = true;
                //_saveBool2();
              });
            },
            child: new RadioItem(sampleData[index]),
          );
        },
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.fromLTRB(30, 20, 0, 10),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 17.0,
            width: 17.0,
            // child: new Center(
            //   child: new Text(_item.buttonText,
            //       style: new TextStyle(
            //           color: _item.isSelected ? Colors.white : Colors.black,
            //           //fontWeight: FontWeight.bold,
            //           fontSize: 18.0)),
            // ),
            decoration: new BoxDecoration(
              color: _item.isSelected ? Colors.blueAccent : Colors.transparent,
              border: new Border.all(
                  width: 2.0,
                  color: _item.isSelected ? Colors.blueAccent : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(30.0)),
            ),
          ),
          new Container(
            margin: new EdgeInsets.only(left: 10.0),
            child: new Text(_item.text),
          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  //final String buttonText;
  final String text;
  RadioModel(this.isSelected, this.text);
}
