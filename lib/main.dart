import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String answer = 'you are correct';
  var myList = [1, 2, 3, 4, 5, 6, 7, 9];
  List newarr = [1, 2, 3];
  var eng_num = 1;
  var counter = 0;

  void selectmynmNo() {
    myList.shuffle();
    newarr = myList.sublist(0, 3);
  }

  void selectNum() {
    newarr.shuffle();
    eng_num = newarr[0];
  }

  void press() {
    if (myList[0] == eng_num) {
      answer = 'Correct';
      counter += 10;
    } else {
      answer = ' Uncorrect';
      counter -= 10;
    }
  }

  void press1() {
    if (myList[1] == eng_num) {
      answer = 'Correct';
      counter += 10;
    } else {
      answer = ' Uncorrect';
      counter -= 10;
    }
  }

  void press2() {
    if (myList[2] == eng_num) {
      answer = 'Correct';
      counter += 10;
    } else {
      answer = ' Uncorrect';
      counter -= 10;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('select the number ${newarr[0]}'),
          GestureDetector(
            onTap: () {
              setState(() {
                press();
              });
              final snackBar = SnackBar(
                content: Text(answer),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Image(image: AssetImage('./images/${myList[0]}.png')),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  press1();
                });
                final snackBar = SnackBar(
                  content: Text(answer),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Image(image: AssetImage('./images/${myList[1]}.png'))),
          GestureDetector(
              onTap: () {
                setState(() {
                  press2();
                });
                final snackBar = SnackBar(
                  content: Text(answer),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Image(image: AssetImage('./images/${myList[2]}.png'))),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  selectmynmNo();
                  selectNum();
                });
              },
              child: const Text('Refresh')),
          Text('Score : ${counter}'),
        ],
      ),
    );
  }
}
