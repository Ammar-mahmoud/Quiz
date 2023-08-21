import 'package:flutter/material.dart';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const Exam());
}

class Exam extends StatelessWidget {
  const Exam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[600],
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: Text(
            'Exam',
            style: TextStyle(fontSize: 34, color: Colors.amberAccent[700]),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
          child: examPage(),
        ),
      ),
    );
  }
}

class examPage extends StatefulWidget {
  const examPage({super.key});

  @override
  State<examPage> createState() => _examPageState();
}

class _examPageState extends State<examPage> {
  List<Widget> answerResult = [];
  int r = 0;
  List<Question> Questions = [
    Question(
        Text: 'Is the number of planets in the picture 8 planets?',
        Image: 'images/image-1.jpg',
        Answer: true),
    Question(Text: 'Are cats pets?', Image: 'images/image-2.jpg', Answer: true),
    Question(
        Text: 'Is China located on the continent of Africa?',
        Image: 'images/image-3.jpg',
        Answer: false),
    Question(
        Text: 'Is the earth flat and not spherical?',
        Image: 'images/image-4.jpg',
        Answer: false),
  ];
  int current = 0;
  void add_like() {
    answerResult.add(Padding(
      padding: const EdgeInsets.all(4.0),
      child: Icon(
        Icons.thumb_up,
        color: Colors.lightGreenAccent[400],
      ),
    ));
  }

  void add_dislike() {
    answerResult.add(Padding(
      padding: const EdgeInsets.all(4.0),
      child: Icon(
        Icons.thumb_down,
        color: Colors.redAccent[700],
      ),
    ));
  }

  void alert() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Exam over!",
      desc: "Your Degree is $r / ${Questions.length} ",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
    r = 0;
    current = 0;
    answerResult.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Image.asset(Questions[current].questionImage),
              SizedBox(
                height: 20,
              ),
              Text(
                Questions[current].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, color: Colors.amber[400]),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[900],
                    minimumSize: Size(100, 50)),
                child: Text(
                  'False',
                  style: TextStyle(fontSize: 28, color: Colors.amber[800]),
                ),
                onPressed: () {
                  setState(() {
                    if (!Questions[current].questionAnswer) {
                      r++;
                      add_like();
                    } else {
                      add_dislike();
                    }
                    current++;
                    if (current > Questions.length - 1) {
                      alert();
                    }
                  });
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    minimumSize: Size(100, 50)),
                child: Text(
                  'True',
                  style: TextStyle(fontSize: 28, color: Colors.amber[800]),
                ),
                onPressed: () {
                  setState(() {
                    if (Questions[current].questionAnswer) {
                      r++;
                      add_like();
                    } else {
                      add_dislike();
                    }
                    current++;
                    if (current > Questions.length - 1) {
                      alert();
                    }
                  });
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
