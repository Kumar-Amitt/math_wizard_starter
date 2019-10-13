import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuizPage(),
  ));
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}
 List<String> operators = ['+', '-', 'x', '/'];
class _QuizPageState extends State<QuizPage> {

  int n1 = Random().nextInt(100);
  int n2 = Random().nextInt(100);
  String currentOperator = operators[Random().nextInt(4)];

  int userInput = 0;
  int score = 0;

  int calculate(int n1, int n2) {
    int result;
    switch (currentOperator){
      case'+':
        result = n1+n2;
        break;
      case '-':
        result = n1-n2;
        break;
      case 'x':
        result = n1*n2;
        break;
      case '/':
        result = n1~/n2;
        break;
    }
    return result;
  }

  final myController = TextEditingController();

  submit() {
    setState(() {
      userInput = int.parse(myController.text);
    });
  }

  void compare() {
    int calcV = calculate(n1, n2);
    submit();
    //print(userInput);
    setState(() {
      if (calcV == userInput)
        score += 5;
      else
        score -= 5;
      reset();
    });
//    myController.dispose();
//    super.dispose();

  }

  void reset() {
    setState(() {
      n1 = Random().nextInt(100);
      n2 = Random().nextInt(100);
      currentOperator = operators[Random().nextInt(4)];
      myController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF26B405),
        title: Center(child: Text('MathWiz')),
      ),
      body: Container(
        color: Color(0xFFE9FCD0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '$n1 $currentOperator $n2 =',
                          style:
                              TextStyle(color: Color(0xFF036AB6), fontSize: 56),
                        ),
//                          TextField(
//                            keyboardType: TextInputType.number,
//                            controller: myController,
//                            decoration: InputDecoration(
//                              border: OutlineInputBorder(),
//                            ),
//                            //  onSubmitted: submit,
//                          ),
                      ],
                    ),
//                    Expanded(
//                      child: Text(
//                        ' $currentOperator',
//                        style:
//                            TextStyle(color: Color(0xFF036AB6), fontSize: 56),
//                      ),
//                    ),
//                    Expanded(
//                      child: Text(
//                        '$n2',
//                        style:
//                            TextStyle(color: Color(0xFF036AB6), fontSize: 56),
//                      ),
//                    ),
//                    Expanded(
//                      child: Text(
//                        '=',
//                        style:
//                            TextStyle(color: Color(0xFF036AB6), fontSize: 56),
//                      ),
//                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: myController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        //  onSubmitted: submit,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      color: Color(0xFF26B405),
                      child: FlatButton(
                        child: Text(
                          'CHECK',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        onPressed: compare,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      color: Color(0xFF036AB6),
                      child: FlatButton(
                        child: Text('SKIP',
                            style:
                                TextStyle(color: Colors.white, fontSize: 24)),
                        onPressed: reset,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Text(
                'Score: $score',
                style: TextStyle(color: Color(0xFF26B405), fontSize: 64),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
